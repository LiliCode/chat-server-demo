/// 服务协议
abstract class ServerProtocol {
  bool get isRunning;
  Future<void> run() async {}
  Future<void> stop({bool? force}) async {}
}

/// 任务
abstract class SocketTask {
  Future<void> onStart() async {}
  Future<void> onStop() async {}
}

/// 消息处理
abstract class MessageHandle {
  Future<void> onMessage(dynamic message) async {}
}
