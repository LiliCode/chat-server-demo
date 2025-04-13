import 'dart:convert';
import 'dart:io';

import 'package:dart_server_application/server/base/server_protocol.dart';
import 'package:dart_server_application/services/im_services/base/socket_message_handle.dart';
import 'package:dart_server_application/services/im_services/base/socket_user.dart';
import 'package:dart_server_application/services/im_services/base/socket_user_task.dart';
import 'package:dart_server_application/services/im_services/base/socket_user_task_center.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_router/shelf_router.dart';
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

  final _taskCenter = SocketUserTaskCenter();

  @override
  Future<void> run() async {
    if (_isRunning && _server != null) {
      print('Socket 服务正在运行!!!');
      return;
    }

    // 创建路由
    final router = Router();
    router.get('/', (Request request) {
      // 处理 socket 连接
      final handler = webSocketHandler((channel, protocol) {
        // 创建一个连接的用户对象
        final user = SocketUser(channel: channel, headers: request.headers);
        // 创建消息处理
        final handler = SocketMessageHandle(user);

        // 加入任务
        _taskCenter.addSocketUser(SocketUserTask(user, handler: handler));
      });

      // WebSocket 连接是通过 HTTP 升级请求建立的，可以在处理升级请求时访问 headers
      handler(request);
    });

    router.post('/receive', (Request request) async {
      final body = await request.readAsString();
      print('收到了消息: $body');
      return Response.ok(jsonEncode({'code': 200}));
    });

    // 启动 Socket 服务
    _server = await shelf_io.serve(router, host, port ?? 3000);
    _isRunning = true;
    print('Serving at ws://${_server!.address.host}:${_server!.port}');
  }

  @override
  Future<void> stop({bool? force}) async {
    await _server?.close(force: force ?? false);
    await _taskCenter.removeAll();
    _server = null;
    _isRunning = false;
  }
}
