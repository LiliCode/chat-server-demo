import 'dart:async';

import 'package:dart_server_application/server/res.dart';
import 'package:shelf/shelf.dart';

enum HttpMethod { get, post, put, delete }

typedef ApiHandler = FutureOr<ResponseData<dynamic>> Function(Request req);

class ApiRoute {
  final String name;
  final HttpMethod method;
  final ApiHandler? handler;

  ApiRoute(this.name, {this.method = HttpMethod.get, this.handler});
}

abstract class ApiRouteTable {
  List<ApiRoute> get table => [];
}
