import 'package:dart_server_application/server/base/req_method.dart';
import 'package:dart_server_application/enums/service_name.dart';
import 'package:dart_server_application/server/base/service_api.dart';
import 'package:dart_server_application/server/base/res.dart';
import 'package:shelf/src/request.dart';

import '../../sqlite_db/database.dart';

/// 首页服务
class HomeService implements ServiceApi {
  @override
  Map<String, ServiceAction> get actions => {
        'list': ServiceAction(handler: list),
      };

  @override
  ServiceName get name => ServiceName.home;

  /// 主页，用户列表
  ///
  /// 参数：id 自己的用户id，用来过滤自己
  Future<ResultData> list(Request req) async {
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

    return ResultData.success(list);
  }

  @override
  Future<void> dispose() async {}
}
