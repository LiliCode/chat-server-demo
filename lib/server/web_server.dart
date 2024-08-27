import 'dart:async';
import 'dart:io';

import 'package:dart_server_application/server/request_handler.dart';
import 'package:dart_server_application/server/server_protocol.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;

/// Web 服务器
class WebServer implements ServerProtocol {
  final String host;
  final int? port;
  final WebServerRequestHandler? requestHandler;

  HttpServer? _server;

  WebServer(this.host, {this.port, this.requestHandler});

  bool _isRunning = false;

  @override
  bool get isRunning => _isRunning;

  @override
  Future<void> run() async {
    if (_server != null) {
      print('Server running!!!');
      return;
    }

    final handler = Pipeline().addMiddleware(logRequests()).addHandler((request) async =>
        await requestHandler?.onReceive(request) ?? await _echoRequest(request));
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
