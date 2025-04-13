import 'dart:async';
import 'dart:io';

import 'package:dart_server_application/server/base/req_method.dart';
import 'package:dart_server_application/server/base/server_protocol.dart';
import 'package:dart_server_application/server/base/service_api.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

/// Web 服务器
class WebServer implements ServerProtocol {
  final String host;
  final int? port;
  final List<ServiceApi>? serviceTable;

  HttpServer? _server;

  WebServer(this.host, {this.port, this.serviceTable});

  bool _isRunning = false;

  @override
  bool get isRunning => _isRunning;

  @override
  Future<void> run() async {
    if (_isRunning && _server != null) {
      print('Server 正在运行!!!');
      return;
    }

    final router = Router();
    router.get('/', (Request req) async => Response.ok('Hello world'));

    if (serviceTable != null && serviceTable!.isNotEmpty) {
      for (final service in serviceTable!) {
        for (final methodName in service.actions.keys) {
          final action = service.actions[methodName];
          if (action == null) continue;

          final path = '/${service.name.value}/$methodName';
          if (action.method == ReqMethod.post) {
            router.post(path, (Request req) async {
              final res = await action.handler.call(req);
              return Response.ok(res.toString());
            });
          } else if (action.method == ReqMethod.get) {
            router.get(path, (Request req) async {
              final res = await action.handler.call(req);
              return Response.ok(res.toString());
            });
          } else {
            print('不支持的接口: $path');
          }
        }
      }
    }

    final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);
    _server = await shelf_io.serve(handler, host, port ?? 8080);
    // Enable content compression
    _server!.autoCompress = true;
    _isRunning = true;

    print('Serving at http://${_server!.address.host}:${_server!.port}');
  }

  @override
  Future<void> stop({bool? force}) async {
    await _server?.close(force: force ?? false);
    _server = null;
    _isRunning = false;
  }

  /// http 请求的回调
  FutureOr<Response> _echoRequest(Request request) async {
    return Response.notFound('404');
  }
}
