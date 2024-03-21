import 'package:dart_server_application/web_server.dart' as server;

void main(List<String> arguments) {
  final bindIp = arguments.isNotEmpty ? arguments.first : null;
  server.runSever(bindIp: bindIp);
}
