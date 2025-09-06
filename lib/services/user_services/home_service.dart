import 'package:dart_server_application/isar_models/user.dart';
import 'package:dart_server_application/enums/service_name.dart';
import 'package:dart_server_application/server/base/service_api.dart';
import 'package:dart_server_application/server/base/res.dart';
import 'package:dart_server_application/isar/get_isar.dart';
import 'package:isar/isar.dart';
import 'package:shelf/shelf.dart';

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
    // final params = req.url.queryParameters;
    // final id = params['id'];

    // final list = await GetIsar().instance.users.filter().idGreaterThan(0).findAll();

    final list = await GetIsar().call<List<User>>((isar) async {
      return await isar.users.filter().idGreaterThan(0).findAll();
    });

    return ResultData.success(list.map((e) => e.toJson()).toList());
  }

  @override
  Future<void> dispose() async {}
}
