import 'dart:convert';

/// 消息类型
enum MessageType {
  /// 文字消息
  text('text'),

  /// 图片消息
  image('image'),

  /// 视频消息
  video('video'),

  /// 语音消息
  voice('voice'),

  /// 不受支持的消息
  unknown('unknown');

  final String value;

  const MessageType(this.value);

  /// 将字符串消息类型转换成枚举值
  static MessageType fromValue(String value) => MessageType.values
      .firstWhere((e) => e.value == value, orElse: () => MessageType.unknown);
}

enum ConnectType { http, socket }

/// 消息实体类
class Message {
  final String id;
  final String to;
  final String from;
  final String content;
  final MessageType type;
  final int createAt; // 消息发送时间

  const Message({
    required this.id,
    required this.to,
    required this.from,
    required this.content,
    required this.type,
    required this.createAt,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      id: json['id'] ?? '',
      to: json['to'] ?? '',
      from: json['from'] ?? '',
      content: json['content'] ?? '',
      type: MessageType.fromValue(json['type']),
      createAt: json['createAt'] ?? DateTime.now().microsecondsSinceEpoch,
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['to'] = to;
    data['from'] = from;
    data['content'] = content;
    data['type'] = type.value;
    data['createAt'] = createAt;

    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}
