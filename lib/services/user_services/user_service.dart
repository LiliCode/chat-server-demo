import 'dart:convert';
import 'dart:math';

import 'package:dart_server_application/isar_models/user.dart';
import 'package:dart_server_application/server/base/req_method.dart';
import 'package:dart_server_application/enums/service_name.dart';
import 'package:dart_server_application/extensions/string_extension.dart';
import 'package:dart_server_application/server/base/service_api.dart';
import 'package:dart_server_application/server/base/res.dart';
import 'package:dart_server_application/isar/get_isar.dart';
import 'package:isar/isar.dart';
import 'package:shelf/src/request.dart';

class UserService implements ServiceApi {
  @override
  Map<String, ServiceAction> get actions => {
        'info': ServiceAction(handler: userInfo),
        'login': ServiceAction(method: ReqMethod.post, handler: login),
        'update': ServiceAction(method: ReqMethod.post, handler: update),
        'register': ServiceAction(method: ReqMethod.post, handler: register),
      };

  @override
  ServiceName get name => ServiceName.user;

  /// 获取用户数据
  ///
  /// 参数: id 或者 account
  Future<ResultData> userInfo(Request req) async {
    final params = req.url.queryParameters;
    final String? account = params['account'];
    final String? id = params['id'];

    User? user;
    if (account != null) {
      final results = await GetIsar().call<List<User>>((isar) async {
        return await isar.users.filter().accountEqualTo(account).findAll();
      });

      if (results.isNotEmpty) {
        user = results.first;
      }
    } else if (id != null) {
      final results = await GetIsar().call<List<User>>((isar) async {
        return await isar.users
            .filter()
            .idEqualTo(int.tryParse(id) ?? -1)
            .findAll();
      });

      if (results.isNotEmpty) {
        user = results.first;
      }
    }

    if (user != null) {
      return ResultData.success(user.toJson());
    }

    return ResultData.error('用户不存在!');
  }

  /// 用户登陆
  ///
  /// 参数: password account
  Future<ResultData> login(Request req) async {
    final bodyString = await req.readAsString(utf8);
    final params = bodyString.toMap() ?? {};

    final account = '${params['account'] ?? ''}';
    final pwd = '${params['password'] ?? ''}';

    if (account.isNotEmpty && pwd.isNotEmpty) {
      final results = await GetIsar().call<List<User>>((isar) async {
        return await isar.users.filter().accountEqualTo(account).findAll();
      });

      if (results.isEmpty) {
        return ResultData.error('用户不存在!');
      }

      final user = results.first;
      if (user.password == pwd) {
        return ResultData.success(user.toJson());
      } else {
        return ResultData.error('密码错误');
      }
    } else {
      return ResultData.error('缺少必要参数');
    }
  }

  Future<ResultData> update(Request req) async {
    print('修改信息');
    return ResultData.success(null);
  }

  /// 用户注册接口
  ///
  /// 参数: account, password, name
  Future<ResultData> register(Request req) async {
    // final params = await req.body as Map<String, dynamic>;
    final bodyString = await req.readAsString(utf8);
    final params = bodyString.toMap() ?? {};

    if (params.isEmpty) {
      return ResultData.error('没有参数');
    }

    final String? account = params['account'] as String?;
    final String? password = params['password'] as String?;
    final String? name = params['name'] as String?;

    if (account == null || password == null || name == null) {
      return ResultData.error('缺少必要参数');
    }

    // 查找是否存在这个用户名的用户
    final count = await GetIsar().call<int>((isar) async {
      return await isar.users.filter().accountEqualTo(account).count();
    });

    if (count > 0) {
      return ResultData.error('用户名存在，请更改用户名');
    }

    // 不存在这个用户
    final avatars = [
      'https://ww1.sinaimg.cn/mw690/005J4OU5ly1huxb0v5u9uj30u00u0mzv.jpg',
      'https://img2.woyaogexing.com/2021/08/12/4eb9e0a3d689453295ae9cbd977db75a%21400x400.jpeg',
      'https://ww4.sinaimg.cn/mw690/006upAuggy1i2gwhhinisj30u00u0n0v.jpg',
      'https://img2.baidu.com/it/u=504955003,2030954079&fm=253&app=138&f=JPEG?w=843&h=800',
      'https://img1.baidu.com/it/u=1708316691,2822640255&fm=253&fmt=auto&app=138&f=JPEG?w=400&h=400'
    ];

    final avatar = avatars[Random().nextInt(5)];

    final user =
        User(name: name, account: account, password: password, avatar: avatar);

    await GetIsar().call<void>((isar) async {
      await isar.writeTxn(() async {
        await isar.users.put(user);
      });
    });

    return ResultData.success({'msg': '注册成功'});
  }

  @override
  Future<void> dispose() async {}
}
