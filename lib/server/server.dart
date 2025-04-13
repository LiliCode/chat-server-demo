import 'package:dart_server_application/server/web_server/web_server.dart';

import 'base/service_api.dart';

/// Dart 服务器
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
    int socketPort = 3000,
    List<ServiceApi>? services,
  }) async {
    // 启动 WebServer
    if (_webServer == null) {
      _webServer = WebServer(host, port: port, serviceTable: services);
      await _webServer?.run();
    }
  }

  /// 停止服务器
  Future<void> stop() async {
    await _webServer?.stop();
  }
}
