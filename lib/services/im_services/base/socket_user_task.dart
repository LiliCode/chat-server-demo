import 'dart:async';

import 'package:dart_server_application/server/base/server_protocol.dart';
import 'package:dart_server_application/services/im_services/base/socket_user.dart';

abstract class SocketUserTaskDelegate {
  /// 收到了断开连接
  Future<void> didReceiveDisconnect(SocketUser user) async {
    throw UnimplementedError();
  }
}

class SocketUserTask implements SocketTask {
  final SocketUser user;
  final MessageHandle? handler;
  SocketUserTaskDelegate? delegate;

  SocketUserTask(this.user, {this.delegate, this.handler});

  StreamSubscription? _socketSubscription;

  @override
  Future<void> onStart() async {
    _socketSubscription = user.channel.stream.listen(
      handler?.onMessage,
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
