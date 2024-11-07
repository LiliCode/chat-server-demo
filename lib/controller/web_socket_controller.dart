import 'dart:convert';
import 'dart:io';

class WebSocketController {
  static final Map<String, WebSocket> users = {};

  // static WebSocketSession socketSession(HttpRequest req) {
  //   final id = req.headers.value('id');
  //   return WebSocketSession(
  //     onOpen: (ws) {
  //       if (id != null) {
  //         users[id] = ws;
  //       }

  //       print('用户 $id 已经连接 ...');
  //     },
  //     onClose: (ws) {
  //       // 已出相应的用户
  //       users.removeWhere((key, value) => key == id);
  //       print('用户 $id 已经关闭连接 ...');
  //     },
  //     onMessage: (ws, dynamic data) async {
  //       Map<String, dynamic> message =
  //           json.decode(data).cast<String, dynamic>();
  //       Map<String, dynamic> to = message['to'];
  //       String toId = '${to['id']}';
  //       // 发送给对方
  //       users[toId]?.add(data);

  //       print('服务器接收到消息: $message');
  //     },
  //     onError: (webSocket, error) {
  //       print('Socket Error: $error');
  //     },
  //   );
  // }
}
