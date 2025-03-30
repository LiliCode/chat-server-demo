import 'package:dart_server_application/server/socket_server/socket_user.dart';
import 'package:dart_server_application/server/socket_server/socket_user_task.dart';

import '../base/status_code.dart';

/// 任务中心，用于管理连接的 SocketUser
class SocketUserTaskCenter implements SocketUserTaskDelegate {
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

  @override
  Future<void> didReceiveDisconnect(SocketUser user) async {
    removeSocketUser(user.id);
  }
}
