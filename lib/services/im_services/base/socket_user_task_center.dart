import 'package:dart_server_application/isar_models/user.dart';
import 'package:dart_server_application/services/im_services/base/socket_user.dart';
import 'package:dart_server_application/services/im_services/base/socket_user_task.dart';

import '../../../isar/get_isar.dart';
import '../../../server/base/status_code.dart';

/// 任务中心，用于管理连接的 SocketUser
class SocketUserTaskCenter implements SocketUserTaskDelegate {
  static final _instance = SocketUserTaskCenter._();

  SocketUserTaskCenter._();

  factory SocketUserTaskCenter() => _instance;

  final _taskPool = <String, SocketUserTask>{};

  /// 把新的 user 添加进任务中心
  Future<void> addSocketUser(SocketUserTask task) async {
    if (task.user.headers.isEmpty) {
      await task.user.disconnect(status: SocketStatusCode.headersNotEmpty);
      return;
    }

    final id = task.user.id;
    if (id.isEmpty) {
      await task.user.disconnect(status: SocketStatusCode.idNotEmpty);
      return;
    }

    // 检查是否存在这个用户
    final user = await GetIsar().instance.users.get(int.tryParse(id) ?? 0);
    if (user == null) {
      await task.user.disconnect(status: SocketStatusCode.userNotExists);
      return;
    }

    // 保存任务
    _taskPool[id] = task;
    task.delegate = this;

    // 开始任务
    await task.onStart();
  }

  /// 从任务中心删除
  Future<void> removeSocketUser(String id) async {
    if (id.isEmpty) return;

    final task = _taskPool.remove(id);
    await task?.onStop();
    print('任务被删除: $id');
  }

  /// 删除全部任务
  Future<void> removeAll() async {
    for (final id in _taskPool.keys) {
      await removeSocketUser(id);
    }
  }

  /// 根据 id 获取连接任务
  SocketUserTask? getUserTaskById(String id) {
    if (id.isEmpty) return null;

    return _taskPool[id];
  }

  @override
  Future<void> didReceiveDisconnect(SocketUser user) async {
    removeSocketUser(user.id);
  }
}
