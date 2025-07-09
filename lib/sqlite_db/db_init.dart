import 'dart:io';
import 'package:dart_server_application/isar_models/user.dart';
import 'package:isar/isar.dart';

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

    _isar = await Isar.open([UserSchema], directory: directory.path);
  }
}
