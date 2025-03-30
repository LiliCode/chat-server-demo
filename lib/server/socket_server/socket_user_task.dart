import 'dart:async';

import 'package:dart_server_application/server/socket_server/socket_user.dart';
import 'package:dart_server_application/server/base/server_protocol.dart';

abstract class SocketUserTaskDelegate {
  Future<void> didReceiveDisconnect(SocketUser user) async {
    throw UnimplementedError();
  }
}

class SocketUserTask implements SocketTask {
  final SocketUser user;
  SocketUserTaskDelegate? delegate;

  SocketUserTask(this.user, {this.delegate});

  StreamSubscription? _socketSubscription;

  @override
  Future<void> onStart() async {
    _socketSubscription = user.channel.stream.listen(
      (message) {
        print('收到了消息: $message');
        user.send('Hello $message');
      },
      onDone: () {
        print('有用户断开连接: ${user.headers['id']}');
        // 回调
        delegate?.didReceiveDisconnect(user);
      },
      onError: (e) {
        print('ERROR: $e');
      },
    );
  }

  @override
  Future<void> onStop() async {
    _socketSubscription?.cancel();
  }
}
