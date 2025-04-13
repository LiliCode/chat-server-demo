import 'package:dart_server_application/server/base/status_code.dart';
import 'package:web_socket_channel/io.dart';

/// Socket 连接的用户对象
class SocketUser {
  final Map<String, String> headers;
  final IOWebSocketChannel channel;

  String get id => headers['id'] ?? '';

  const SocketUser({required this.channel, required this.headers});

  /// 发送消息
  ///
  /// [message] 消息字符串，可以是任何字符串
  void send(String message) async {
    if (message.isNotEmpty) {
      channel.sink.add(message);
    }
  }

  /// 断开连接
  ///
  /// [status] 状态码的枚举
  Future<void> disconnect({SocketStatusCode? status}) async {
    await channel.sink.close(status?.code, status?.reason);
  }
}
