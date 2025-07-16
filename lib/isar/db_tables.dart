import 'package:dart_server_application/isar_models/user.dart';
import 'package:isar/isar.dart';

/// 数据库表
abstract class IsarTables {
  static final tables = <CollectionSchema>[UserSchema];
}
