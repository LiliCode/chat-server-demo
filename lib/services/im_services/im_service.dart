import 'dart:convert';

import 'package:dart_server_application/enums/service_name.dart';
import 'package:dart_server_application/server/base/req_method.dart';
import 'package:dart_server_application/server/base/res.dart';
import 'package:dart_server_application/server/base/service_api.dart';
import 'package:dart_server_application/services/im_services/base/offline_message_buffer.dart';
import 'package:dart_server_application/services/im_services/models/message.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';

import 'base/socket_message_handle.dart';
import 'base/socket_user.dart';
import 'base/socket_user_task.dart';
import 'base/socket_user_task_center.dart';

/// IM 服务
class ImService implements ServiceApi {
  final _messageHandle = const SocketMessageHandle();

  @override
  Map<String, ServiceAction> get actions => {
        'connect': ServiceAction(handler: connect),
        'send': ServiceAction(method: ReqMethod.post, handler: send),
      };

  @override
  ServiceName get name => ServiceName.im;

  /// 建立 Socket 连接
  Future<ResultData> connect(Request req) async {
    // 处理 socket 连接
    final handler = webSocketHandler((channel, protocol) {
      // 创建一个连接的用户对象
      final user = SocketUser(channel: channel, headers: req.headers);
      // 创建监听任务
      final task = SocketUserTask(user, onMessage: _messageHandle.onMessage);

      // 加入任务
      SocketUserTaskCenter().addSocketUser(task);

      // 查询是否有这个用户的离线消息
      final offlineMessages = OfflineMessageBuffer().getMessagesById(user.id);
      if (offlineMessages != null && offlineMessages.isNotEmpty) {
        user.send(jsonEncode(offlineMessages.map((e) => e.toJson()).toList()));
        // 清除这个用户的离线消息缓存
        OfflineMessageBuffer().removeMessages(user.id);
      }
    });

    // WebSocket 连接是通过 HTTP 升级请求建立的，可以在处理升级请求时访问 headers
    handler(req);

    return ResultData.success('ok');
  }

  /// 客户端发送消息的接口
  Future<ResultData> send(Request req) async {
    try {
      final messageBody = await req.readAsString(utf8);
      await _messageHandle.onMessage(ConnectType.http, messageBody);
      return ResultData.success('ok');
    } catch (e) {
      return ResultData.error(e.toString());
    }
  }

  @override
  Future<void> dispose() async {
    // 删除全部连接任务
    await SocketUserTaskCenter().removeAll();
  }
}
