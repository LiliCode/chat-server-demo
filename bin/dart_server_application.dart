import 'package:dart_server_application/web_server.dart' as server;

void main(List<String> arguments) {
  print('输入的参数: $arguments');
  final bindIp = arguments.length > 1 ? arguments.first : null;
  server.runSever(bindIp: bindIp);
}
