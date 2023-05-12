import 'dart:async';
import 'dart:io';

import 'package:alfred/alfred.dart';
import 'package:dart_server_application/sqlite_db/database.dart';
import 'package:dart_server_application/tools/response_tools.dart';
import 'package:sqlite3/sqlite3.dart';

class UserController {
  /// 获取用户数据
  ///
  /// 参数: id 或者 account
  static FutureOr<dynamic> userInfo(HttpRequest req, HttpResponse res) async {
    res.headers.contentType = ContentType.json;
    final params = req.uri.queryParameters;
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
      return ResponseTools(ResponseStatus.error(description: '缺少必要参数'))
          .response;
    }

    if (result == null || (result != null && result!.isEmpty)) {
      return ResponseTools(ResponseStatus.error(description: '用户不存在')).response;
    }

    // 用户数据存在
    final Map<String, dynamic> info = {};
    for (final key in result!.first.keys) {
      info[key] = result!.first[key];
    }

    return ResponseTools(ResponseStatus.success(), info: info).response;
  }

  /// 用户登陆
  ///
  /// 参数: password account
  static FutureOr<dynamic> login(HttpRequest req, HttpResponse res) async {
    res.headers.contentType = ContentType.json;
    final params = await req.body as Map<String, dynamic>;
    final String? account = params['account'];
    final String? pwd = params['password'];

    ResultSet? result;

    if (account != null && pwd != null) {
      ChatDB.perform((db) {
        result = db.select('SELECT * FROM user WHERE account=?', [account]);
      });
    } else {
      return ResponseTools(ResponseStatus.error(description: '缺少必要参数'))
          .response;
    }

    if (result == null || (result != null && result!.isEmpty)) {
      return ResponseTools(ResponseStatus.error(description: '用户不存在')).response;
    }

    // 用户数据存在

    // 判断密码是否正确
    if (result!.first['password'] != pwd) {
      return ResponseTools(ResponseStatus.error(description: '密码错误')).response;
    }

    final Map<String, dynamic> info = {};
    for (final key in result!.first.keys) {
      info[key] = result!.first[key];
    }

    return ResponseTools(ResponseStatus.success(), info: info).response;
  }

  static FutureOr<dynamic> update(HttpRequest req, HttpResponse res) {
    print('修改信息');
    res.headers.contentType = ContentType.json;
    return ResponseTools(ResponseStatus.success()).response;
  }

  /// 用户注册接口
  ///
  /// 参数: account, password, name
  static FutureOr<dynamic> register(HttpRequest req, HttpResponse res) async {
    res.headers.contentType = ContentType.json;
    final params = await req.body as Map<String, dynamic>;
    if (params.isEmpty) {
      return ResponseTools(ResponseStatus.error(description: '没有参数')).response;
    }

    final String? account = params['account'] as String?;
    final String? password = params['password'] as String?;
    final String? name = params['name'] as String?;

    if (account == null || password == null || name == null) {
      return ResponseTools(ResponseStatus.error(description: '缺少必要参数'))
          .response;
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
      return ResponseTools(ResponseStatus.error(description: '存在这个用户'))
          .response;
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

    return ResponseTools(ResponseStatus.success(), info: {'msg': '注册成功'})
        .response;
  }
}
