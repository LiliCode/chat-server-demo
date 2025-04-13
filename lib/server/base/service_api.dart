import 'package:dart_server_application/server/base/req_method.dart';
import 'package:shelf/shelf.dart';

import '../../enums/service_name.dart';
import 'res.dart';

typedef ActionFunction = Future<ResultData<dynamic>> Function(Request req);

class ServiceAction {
  final ReqMethod method;
  final ActionFunction handler;

  const ServiceAction({this.method = ReqMethod.get, required this.handler});
}

/// 服务接口，服务须遵循此规范
abstract class ServiceApi {
  /// 接口具体实现的 Map
  Map<String, ServiceAction> get actions;

  /// 服务名称
  ServiceName get name;

  /// 销毁的时候调用
  Future<void> dispose();
}
