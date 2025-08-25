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

/// 连接类型
enum ConnectType { http, socket }
