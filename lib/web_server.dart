import 'dart:io';

import 'package:dart_server_application/controller/web_socket_controller.dart';
import 'package:dart_server_application/routes/api_routes.dart' as route;
import 'package:dart_server_application/server/server.dart';
import 'package:dart_server_application/sqlite_db/db_init.dart';
import 'package:dart_server_application/tools/response_tools.dart';

// Track connected clients
final users = <WebSocket>[];

void runSever({String? bindIp}) async {
  // 初始化数据库表
  ChatDBInit.init();

  await DartServer().run(bindIp ?? '0.0.0.0', table: route.HttpRouteTable());
}
