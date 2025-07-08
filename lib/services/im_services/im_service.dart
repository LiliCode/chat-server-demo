import 'dart:convert';

import 'package:dart_server_application/enums/service_name.dart';
import 'package:dart_server_application/extensions/string_extension.dart';
import 'package:dart_server_application/server/base/req_method.dart';
import 'package:dart_server_application/server/base/res.dart';
import 'package:dart_server_application/server/base/service_api.dart';
import 'package:dart_server_application/services/im_services/models/message.dart';
import 'package:shelf/shelf.dart';
import 'package:shelf_web_socket/shelf_web_socket.dart';

import 'base/socket_message_handle.dart';
import 'base/socket_user.dart';
import 'base/socket_user_task.dart';
import 'base/socket_user_task_center.dart';

/// IM 服务
class ImService implements ServiceApi {
  final _taskCenter = SocketUserTaskCenter();

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
      // 创建消息处理
      final handler = SocketMessageHandle(user);

      // 加入任务
      _taskCenter.addSocketUser(SocketUserTask(user, handler: handler));
    });

    // WebSocket 连接是通过 HTTP 升级请求建立的，可以在处理升级请求时访问 headers
    handler(req);

    return ResultData.success('ok');
  }

  /// 客户端发送消息的接口
  Future<ResultData> send(Request req) async {
    final bodyString = await req.readAsString(utf8);
    final body = bodyString.toMap() ?? {};
    print('收到客户端消息: $body');

    final message = Message.fromJson(body);
    final userTask = _taskCenter.getUserTaskById(message.to);
    if (userTask == null) {
      print('用户 ${message.to} 不存在或者未连接');
      // TODO 缓存消息，等待对方上线之后统一推送给对方
    } else {
      // 对方在线，立即向对方转发消息
      userTask?.user.send(bodyString);
    }

    return ResultData.success('ok');
  }

  @override
  Future<void> dispose() async {}
}
