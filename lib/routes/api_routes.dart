import 'package:dart_server_application/controller/home_controller.dart';
import 'package:dart_server_application/controller/user_controller.dart';
import 'package:dart_server_application/server/route.dart';

class HttpRouteTable implements ApiRouteTable {
  @override
  List<ApiRoute> get table => [
        ApiRoute('/user/info', handler: UserController.userInfo),
        ApiRoute('/home/list', handler: HomeController.list),
        ApiRoute('/user/update', method: HttpMethod.post, handler: UserController.update),
        ApiRoute('/user/register',
            method: HttpMethod.post, handler: UserController.register),
        ApiRoute('/user/login', method: HttpMethod.post, handler: UserController.login),
      ];
}
