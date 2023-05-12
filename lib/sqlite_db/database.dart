import 'package:sqlite3/sqlite3.dart';

// const String _dbPath = '/Users/lili/Documents/Code/Database/chatapp.db';
const String _dbPath = '/home/ubuntu/db/chatapp.db';

class ChatDB {
  ChatDB._();

  /// 执行操作
  static void perform(void Function(Database)? callback) {
    if (callback != null) {
      // 打开数据库
      final db = sqlite3.open(_dbPath);
      // 执行回调中的操作
      callback(db);
      // 关闭数据库
      db.dispose();
    }
  }
}
