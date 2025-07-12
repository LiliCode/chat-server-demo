import 'package:dart_server_application/server/server.dart';
import 'package:dart_server_application/services/im_services/im_service.dart';
import 'package:dart_server_application/services/user_services/home_service.dart';
import 'package:dart_server_application/services/user_services/user_service.dart';
import 'package:dart_server_application/isar/get_isar.dart';

void runSever({String? bindIp}) async {
  // 初始化数据库表
  await GetIsar().initialized();

  // 运行服务
  await DartServer().run(
    bindIp ?? '0.0.0.0',
    services: [HomeService(), UserService(), ImService()],
  );
}
