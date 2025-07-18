/// 一些状态码
enum SocketStatusCode {
  idNotEmpty(3000, 'id 不能为空'),
  headersNotEmpty(3001, 'headers 不能为空'),
  userNotExists(3002, '用户不存在');

  const SocketStatusCode(this.code, [this.reason]);

  final int code;
  final String? reason;
}
