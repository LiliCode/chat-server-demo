import 'package:shelf/shelf.dart';

abstract class WebServerRequestHandler {
  /// 接收到请求
  ///
  /// req 请求体
  /// [return] 返回 response
  Future<Response> onReceive(Request req) async => Response.notFound('404');
}

abstract class WebSocketEventHandler {
  Future<void> onReceive() async {}
}
