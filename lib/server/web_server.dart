import 'dart:async';
import 'dart:io';

import 'package:dart_server_application/server/route.dart';
import 'package:dart_server_application/server/server_protocol.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';

/// Web 服务器
class WebServer implements ServerProtocol {
  final String host;
  final int? port;
  final ApiRouteTable? table;

  HttpServer? _server;

  WebServer(this.host, {this.port, this.table});

  bool _isRunning = false;

  @override
  bool get isRunning => _isRunning;

  @override
  Future<void> run() async {
    if (_server != null) {
      print('Server running!!!');
      return;
    }

    final router = Router();
    router.get('/', (Request req) async => Response.ok('Hello world'));

    if (table != null && table!.table.isNotEmpty) {
      for (final r in table!.table) {
        if (r.method == HttpMethod.get) {
          router.get(r.name, (Request req) async {
            final result = await r.handler?.call(req);
            return Response.ok(result?.toString());
          });
        } else if (r.method == HttpMethod.post) {
          router.post(r.name, (Request req) async {
            final result = await r.handler?.call(req);
            return Response.ok(result?.toString());
          });
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
    _server?.close(force: force ?? false);
    _server = null;
    _isRunning = false;
  }

  /// http 请求的回调
  FutureOr<Response> _echoRequest(Request request) async {
    return Response.notFound('404');
  }
}
