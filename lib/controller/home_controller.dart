import 'dart:async';
import 'dart:io';

import 'package:dart_server_application/sqlite_db/database.dart';
import 'package:dart_server_application/tools/response_tools.dart';

class HomeController {
  /// 主页，用户列表
  ///
  /// 参数：id 自己的用户id，用来过滤自己
  static FutureOr<dynamic> list(HttpRequest req, HttpResponse res) async {
    res.headers.contentType = ContentType.json;
    final params = req.uri.queryParameters;
    final String? id = params['id'];
    List<Map<String, dynamic>> list = [];
    ChatDB.perform((db) {
      final result = db.select('SELECT * FROM user WHERE id != ?', [id]);
      list = result.map((e) {
        return e.map<String, dynamic>((key, value) => MapEntry(key, value));
      }).toList();
    });

    // print(list);

    return ResponseTools(ResponseStatus.success(), info: list).response;
  }
}
