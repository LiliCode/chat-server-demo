import 'package:dart_server_application/services/im_services/base/socket_user.dart';

import '../../../server/base/server_protocol.dart';

/// 消息处理类
class SocketMessageHandle implements MessageHandle {
  final SocketUser user;

  const SocketMessageHandle(this.user);

  @override
  Future<void> onMessage(message) async {
    print('接收到了消息: $message');

    user.send('你好啊');
  }
}
