import 'package:dart_server_application/protobuf/message.pb.dart';

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
    if (messageList != null) {
      // 查找是否存在这条消息
      final exists =
          messageList.where((e) => e.hash == message.hash).isNotEmpty;
      // 存在这条 hash 的消息就不再存储
      if (exists) return;
      // 缓存消息
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
  /// [hash] 消息的 hash 值，为空的时候删除全部消息
  void removeMessage(String to, {String? hash}) {
    if (hash == null || hash.isEmpty) {
      // 删除该用户的全部消息
      _buffer.remove(to);
    } else {
      // 删除指定 hash 的消息
      final list = getMessagesById(to);
      list?.removeWhere((element) => element.hash == hash);
    }
  }
}
