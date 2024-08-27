import 'package:dart_server_application/server/request_handler.dart';
import 'package:shelf/src/request.dart';
import 'package:shelf/src/response.dart';

class HttpRequestHandler implements WebServerRequestHandler {
  @override
  Future<Response> onReceive(Request req) async {
    return Response.ok('hello li');
  }
}
