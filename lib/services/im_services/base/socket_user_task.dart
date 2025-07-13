import 'dart:async';

import 'package:dart_server_application/server/base/server_protocol.dart';
import 'package:dart_server_application/services/im_services/base/socket_user.dart';
import 'package:dart_server_application/services/im_services/models/message.dart';

abstract class SocketUserTaskDelegate {
  /// 收到了断开连接
  Future<void> didReceiveDisconnect(SocketUser user) async {
    throw UnimplementedError();
  }
}

class SocketUserTask implements SocketTask {
  final SocketUser user;
  void Function(ConnectType, String)? onMessage;
  SocketUserTaskDelegate? delegate;

  SocketUserTask(this.user, {this.delegate, this.onMessage});

  StreamSubscription? _socketSubscription;

  @override
  Future<void> onStart() async {
    _socketSubscription = user.channel.stream.listen(
      (message) {
        if (message is String) {
          onMessage?.call(ConnectType.socket, message);
        } else {
          print('消息体不是字符串: $message');
        }
      },
      onDone: () {
        print('用户 ${user.id} 断开连接');
        // 回调
        delegate?.didReceiveDisconnect(user);
      },
      onError: (e) {
        print('ERROR: $e');
      },
    );

    print('用户 ${user.id} 连接成功...');
  }

  @override
  Future<void> onStop() async {
    _socketSubscription?.cancel();
  }
}
