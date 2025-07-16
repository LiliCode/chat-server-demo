import 'dart:io';
import 'package:isar/isar.dart';

import 'db_tables.dart';

/// 全局获取 isar 对象
class GetIsar {
  static final _instance = GetIsar._();

  GetIsar._();

  factory GetIsar() => _instance;

  Isar? _isar;
  Isar get instance {
    assert(_isar != null, 'isar: Must be initialized');
    return _isar!;
  }

  /// 初始化
  Future<void> initialized() async {
    final directory = Directory('./db');
    if (!(await directory.exists())) {
      await directory.create();
    }

    _isar = await Isar.open(IsarTables.tables, directory: directory.path);
  }

  /// 关闭数据库连接
  Future<void> close() async {
    if ((await _isar?.close()) == true) {
      _isar = null;
    }
  }
}
