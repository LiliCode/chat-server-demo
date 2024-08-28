import 'package:dart_server_application/server/route.dart';
import 'package:dart_server_application/server/web_server.dart';

class DartServer {
  static final _shared = DartServer._();
  WebServer? _webServer;

  DartServer._();

  factory DartServer() => _shared;

  /// 启动服务器
  ///
  /// host 主机地址，域名
  /// port 主机端口
  Future<void> run(
    String host, {
    int port = 8080,
    ApiRouteTable? table,
  }) async {
    // 启动 WebServer
    if (_webServer == null) {
      _webServer = WebServer(host, port: port, table: table);
      await _webServer?.run();
    }
  }

  /// 停止服务器
  Future<void> stop() async {
    await _webServer?.stop();
  }
}
