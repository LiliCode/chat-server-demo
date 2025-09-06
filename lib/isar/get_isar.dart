import 'dart:io';
import 'dart:isolate';
import 'package:isar/isar.dart';
import 'db_tables.dart';

/// 数据库 isolate 命令
enum DBTaskIsolateCmd {
  /// 执行任务
  execute(0),

  /// 关闭 Isar 连接
  close(1);

  final int value;
  const DBTaskIsolateCmd(this.value);

  static DBTaskIsolateCmd? fromValue(int value) {
    for (final cmd in DBTaskIsolateCmd.values) {
      if (cmd.value == value) {
        return cmd;
      }
    }

    return null;
  }
}

/// 全局获取 isar 对象
class GetIsar {
  static final _instance = GetIsar._();
  static const String isolateName = 'db_task_isolate';

  GetIsar._();

  factory GetIsar() => _instance;

  /// isolate 实例
  Isolate? _isolate;

  /// isolate 内部的 SendPort
  SendPort? _sendPort;

  /// 初始化
  Future<void> initialized() async {
    try {
      _createDbTaskIsolate();
    } catch (e) {
      print('GetIsar initialized error: $e');
    }
  }

  /// 创建 isar 实例
  Future<Isar> _createIsarInstance() async {
    final directory = Directory('./db');
    if (!(await directory.exists())) {
      await directory.create();
    }

    return Isar.open(IsarTables.tables, directory: directory.path);
  }

  /// 创建数据库处理任务的 isolate
  Future<void> _createDbTaskIsolate() async {
    if (_isolate != null) return;

    final receivePort = ReceivePort();
    _isolate = await Isolate.spawn((sendPort) async {
      // 创建一个在 isolate 内部的 ReceivePort
      final receivePort = ReceivePort();
      // 发送出去
      sendPort.send(receivePort.sendPort);
      // 创建 isar 实例
      final isar = await _createIsarInstance();

      // 接收外面发送过来的消息
      receivePort.listen((params) async {
        await _excuteTask(
          isar,
          DBTaskIsolateCmd.fromValue(params[0])!,
          params[1] as SendPort,
          params[2] as Future<dynamic> Function(Isar)?,
        );
      });
    }, receivePort.sendPort, debugName: isolateName);

    // 获取 isolate 内部的 SendPort，用于随时给 isolate 发送消息
    _sendPort = await receivePort.first as SendPort;
  }

  /// 处理DB任务
  ///
  /// [isar] 数据库对象
  /// [cmd] 任务命令
  /// [sendPort] 用于发送结果的 SendPort
  /// [onProcess] 具体的任务处理函数
  Future<void> _excuteTask(Isar isar, DBTaskIsolateCmd cmd, SendPort sendPort,
      Future<dynamic> Function(Isar)? onProcess) async {
    if (cmd == DBTaskIsolateCmd.execute) {
      // 处理数据
      final result = await onProcess?.call(isar);
      sendPort.send(result);
    } else if (cmd == DBTaskIsolateCmd.close) {
      // 关闭数据库连接
      final res = await isar.close();
      sendPort.send(res);
    }
  }

  /// 获取数据库对象并执行一些操作
  ///
  /// [onProcess] 传入一个函数，函数内可以进行数据库操作，返回值会作为结果返回
  ///
  /// Returns
  /// * R 返回一个数据库的操作结果，类型有传入的泛型参数决定
  Future<R> call<R>(Future<dynamic> Function(Isar) onProcess) async {
    if (_isolate == null || _sendPort == null) {
      _createDbTaskIsolate();
    }

    final responsePort = ReceivePort();
    // 发送操作请求
    _sendPort!.send([
      DBTaskIsolateCmd.execute.value,
      responsePort.sendPort,
      onProcess,
    ]);
    // 等待结果
    final response = (await responsePort.first) as R;
    responsePort.close();
    return response;
  }

  /// 关闭后台 isolate
  Future<void> closeIsolate() async {
    if (_isolate != null) {
      // 关闭数据库连接
      final res = await close();
      if (res) {
        // 关闭 isolate
        _isolate?.kill(priority: Isolate.immediate);
        _isolate = null;
        _sendPort = null;
      }
    }
  }

  /// 关闭数据库连接
  Future<bool> close() async {
    if (_sendPort != null && _isolate != null) {
      final responsePort = ReceivePort();
      // 发送关闭请求
      _sendPort!.send([
        DBTaskIsolateCmd.execute.value,
        responsePort.sendPort,
        null,
      ]);
      final res = await responsePort.first;
      responsePort.close();
      return res;
    }

    return false;
  }
}
