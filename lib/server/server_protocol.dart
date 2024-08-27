/// 服务协议
abstract class ServerProtocol {
  bool get isRunning;
  Future<void> run() async {}
  Future<void> stop({bool? force}) async {}
}
