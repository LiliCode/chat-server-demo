import 'package:dart_server_application/server/base/route.dart';
import 'package:dart_server_application/server/socket_server/socket_server.dart';
import 'package:dart_server_application/server/web_server/web_server.dart';

/// Dart 服务器
class DartServer {
  static final _shared = DartServer._();
  WebServer? _webServer;
  SocketServer? _socketServer;

  DartServer._();

  factory DartServer() => _shared;

  /// 启动服务器
  ///
  /// host 主机地址，域名
  /// port 主机端口
  Future<void> run(
    String host, {
    int port = 8080,
    int socketPort = 3000,
    ApiRouteTable? table,
  }) async {
    // 启动 WebServer
    if (_webServer == null) {
      _webServer = WebServer(host, port: port, table: table);
      await _webServer?.run();
    }

    // 启动 SocketServer
    if (_socketServer == null) {
      _socketServer = SocketServer(host, port: socketPort);
      await _socketServer?.run();
    }
  }

  /// 停止服务器
  Future<void> stop() async {
    await _webServer?.stop();
    await _socketServer?.stop();
  }
}
