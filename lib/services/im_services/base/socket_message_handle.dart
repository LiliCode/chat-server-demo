import 'dart:convert';

import 'package:dart_server_application/isar_models/user.dart';
import 'package:dart_server_application/services/im_services/base/offline_message_buffer.dart';
import 'package:dart_server_application/services/im_services/base/socket_user_task_center.dart';
import 'package:dart_server_application/extensions/string_extension.dart';
import 'package:dart_server_application/services/im_services/models/message.dart';
import 'package:dart_server_application/server/base/server_protocol.dart';
import 'package:dart_server_application/isar/get_isar.dart';
import 'package:isar/isar.dart';

/// 消息处理类
class SocketMessageHandle implements MessageHandle {
  const SocketMessageHandle();

  @override
  Future<void> onMessage(ConnectType type, String messageBody) async {
    print('接收到了 ${type.name} 消息: $messageBody');

    final message = Message.fromJson(messageBody.toMap() ?? {});
    final userTask = SocketUserTaskCenter().getUserTaskById(message.to);
    if (userTask == null) {
      // 检查是否存在这个用户
      final count = await GetIsar()
          .instance
          .users
          .where()
          .idEqualTo(int.tryParse(message.to) ?? 0)
          .count();
      if (count > 0) {
        print('用户 ${message.to} 离线，将要缓存离线消息');
        OfflineMessageBuffer().storeMessage(message, message.to);
      } else {
        print('用户 ${message.to} 不存在');
      }
    } else {
      // 对方在线，立即向对方转发消息
      userTask.user.send(jsonEncode([message.toJson()]));
    }
  }
}
