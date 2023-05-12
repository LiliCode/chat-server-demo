import 'dart:async';
import 'dart:io';

import 'package:dart_server_application/controller/home_controller.dart';
import 'package:dart_server_application/controller/user_controller.dart';

final Map<String, FutureOr<dynamic> Function(HttpRequest, HttpResponse)>
    getroutes = {
  '/user/info': UserController.userInfo,
  '/home/list': HomeController.list,
};

final Map<String, FutureOr<dynamic> Function(HttpRequest, HttpResponse)>
    postroutes = {
  '/user/update': UserController.update,
  '/user/register': UserController.register,
  '/user/login': UserController.login,
};
