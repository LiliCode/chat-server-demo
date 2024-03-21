import 'dart:io';

import 'package:alfred/alfred.dart';
import 'package:dart_server_application/controller/web_socket_controller.dart';
import 'package:dart_server_application/routes/routes.dart' as route;
import 'package:dart_server_application/sqlite_db/db_init.dart';
import 'package:dart_server_application/tools/response_tools.dart';

// Track connected clients
final users = <WebSocket>[];

void runSever({String? bindIp}) async {
  // 初始化数据库表
  ChatDBInit.init();

  // 服务
  final app = Alfred();

  app.get('/', (req, res) => 'Hello Server!!!');

  app.get('/*', (req, res) {
    // web socket
    if (req.uri.path == '/ws') {
      return WebSocketController.socketSession(req);
    }

    if (route.getroutes.containsKey(req.uri.path)) {
      return route.getroutes[req.uri.path]!(req, res);
    }

    return ResponseTools(ResponseStatus.error(description: '未定义的方法')).response;
  });

  app.post('/*', (req, res) {
    if (route.postroutes.containsKey(req.uri.path)) {
      return route.postroutes[req.uri.path]!(req, res);
    }

    return ResponseTools(ResponseStatus.error(description: '未定义的方法')).response;
  });

  print('绑定的IP地址: $bindIp');
  await app.listen(80, bindIp ?? '0.0.0.0');
}
