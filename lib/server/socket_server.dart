import 'dart:io';

import 'package:dart_server_application/server/server_protocol.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_web_socket/shelf_web_socket.dart';

/// Socket 长连接服务
class SocketServer implements ServerProtocol {
  final String host;
  final int? port;

  SocketServer(this.host, {this.port});

  bool _isRunning = false;
  HttpServer? _server;

  @override
  bool get isRunning => _isRunning;

  @override
  Future<void> run() async {
    if (_isRunning && _server != null) {
      print('Socket 服务正在运行!!!');
      return;
    }

    // 处理 Socket 通信
    final handler = webSocketHandler((webSocket) {
      webSocket.stream.listen((message) {
        webSocket.sink.add("Hello world!!!");
      });
    });

    // 启动 Socket 服务
    _server = await shelf_io.serve(handler, host, port ?? 3000);
    _isRunning = true;
    print('Serving at ws://${_server!.address.host}:${_server!.port}');
  }

  @override
  Future<void> stop({bool? force}) async {
    await _server?.close(force: force ?? false);
    _server = null;
    _isRunning = false;
  }
}
