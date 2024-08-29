import 'dart:async';
import 'dart:convert';

import 'package:dart_server_application/extensions/string_extension.dart';
import 'package:dart_server_application/server/res.dart';
import 'package:dart_server_application/sqlite_db/database.dart';
import 'package:shelf/shelf.dart';
import 'package:sqlite3/sqlite3.dart';

class UserController {
  /// 获取用户数据
  ///
  /// 参数: id 或者 account
  static FutureOr<ResponseData> userInfo(Request req) async {
    final params = req.url.queryParameters;
    final String? account = params['account'];
    final String? id = params['id'];

    ResultSet? result;

    if (account != null) {
      ChatDB.perform((db) {
        result = db.select('SELECT * FROM user WHERE account=?', [account]);
      });
    } else if (id != null) {
      ChatDB.perform((db) {
        result = db.select('SELECT * FROM user WHERE id=?', [id]);
      });
    } else {
      return ResponseData.error('缺少必要参数');
    }

    if (result == null || (result != null && result!.isEmpty)) {
      return ResponseData.error('用户不存在');
    }

    // 用户数据存在
    final Map<String, dynamic> info = {};
    for (final key in result!.first.keys) {
      info[key] = result!.first[key];
    }

    return ResponseData<Map<String, dynamic>>.success(d: info);
  }

  /// 用户登陆
  ///
  /// 参数: password account
  static FutureOr<ResponseData> login(Request req) async {
    // final params = await req.body as Map<String, dynamic>;
    final bodyString = await req.readAsString(utf8);
    final params = bodyString.toMap() ?? {};

    final String? account = params['account'];
    final String? pwd = params['password'];

    ResultSet? result;

    if (account != null && pwd != null) {
      ChatDB.perform((db) {
        result = db.select('SELECT * FROM user WHERE account=?', [account]);
      });
    } else {
      return ResponseData.error('缺少必要参数');
    }

    if (result == null || (result != null && result!.isEmpty)) {
      return ResponseData.error('用户不存在');
    }

    // 用户数据存在

    // 判断密码是否正确
    if (result!.first['password'] != pwd) {
      return ResponseData.error('密码错误');
    }

    final Map<String, dynamic> info = {};
    for (final key in result!.first.keys) {
      info[key] = result!.first[key];
    }

    return ResponseData.success(d: info);
  }

  static FutureOr<ResponseData> update(Request req) {
    print('修改信息');
    return ResponseData<Map<String, dynamic>>.success();
  }

  /// 用户注册接口
  ///
  /// 参数: account, password, name
  static FutureOr<ResponseData> register(Request req) async {
    // final params = await req.body as Map<String, dynamic>;
    final bodyString = await req.readAsString(utf8);
    final params = bodyString.toMap() ?? {};

    if (params.isEmpty) {
      return ResponseData.error('没有参数');
    }

    final String? account = params['account'] as String?;
    final String? password = params['password'] as String?;
    final String? name = params['name'] as String?;

    if (account == null || password == null || name == null) {
      return ResponseData.error('缺少必要参数');
    }

    // 查询数据
    bool exists = false;
    ChatDB.perform((db) {
      // 查询是否存在这个用户
      final result = db.select(
        'SELECT count(*) as account FROM user where account=\'$account\'',
      );
      for (final row in result) {
        final count = row['account'] as int;
        if (count != 0) {
          exists = true;
        }
      }
    });

    if (exists) {
      return ResponseData.error('存在这个用户');
    }

    // 不存在这个用户
    ChatDB.perform((db) {
      // 注册新用户
      db.execute(
        'INSERT INTO user(account, password, name, avatar) VALUES(?, ?, ?, ?)',
        [
          account,
          password,
          name,
          'https://pics1.baidu.com/feed/e1fe9925bc315c608b761f58256338154b5477fb.png?token=dc11f5e24ed77b8362acdebf5f85a212',
        ],
      );

      print('注册成功');
    });

    return ResponseData.success(d: {'msg': '注册成功'});
  }
}
