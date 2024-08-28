import 'dart:async';
import 'dart:io';

import 'package:dart_server_application/sqlite_db/database.dart';
import 'package:shelf/shelf.dart';

import '../server/res.dart';

class HomeController {
  /// 主页，用户列表
  ///
  /// 参数：id 自己的用户id，用来过滤自己
  static FutureOr<ResponseData> list(Request req) async {
    final params = req.url.queryParameters;
    final String? id = params['id'];
    List<Map<String, dynamic>> list = [];
    ChatDB.perform((db) {
      final result = db.select('SELECT * FROM user WHERE id != ?', [id]);
      list = result.map((e) {
        return e.map<String, dynamic>((key, value) => MapEntry(key, value));
      }).toList();
    });

    // print(list);

    return ResponseData<List<Map<String, dynamic>>>.success(d: list);
  }
}
