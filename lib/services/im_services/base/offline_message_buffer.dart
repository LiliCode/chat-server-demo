import '../models/message.dart';

/// 缓存离线消息
class OfflineMessageBuffer {
  static final _instance = OfflineMessageBuffer._();

  OfflineMessageBuffer._();

  factory OfflineMessageBuffer() => _instance;

  final _buffer = <String, List<Message>>{};

  /// 暂存离线消息
  ///
  /// [messageBody] 消息体内容
  /// [to] 对方的id
  void storeMessage(Message message, String to) {
    final messageList = _buffer[to];
    if (messageList != null && messageList.isNotEmpty) {
      messageList.add(message);
    } else {
      // 不存在这个缓存列表，重新创建
      _buffer[to] = [message];
    }
  }

  /// 使用对方 id 获取离线消息列表
  ///
  /// [to] 对方的id
  List<Message>? getMessagesById(String to) => _buffer[to];

  /// 删除对方的离线消息
  ///
  /// [to] 对方的id
  void removeMessages(String to) => _buffer.remove(to);
}
