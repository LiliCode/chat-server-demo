import './database.dart';

class ChatDBInit {
  static void init() {
    // 创建 user 表
    ChatDB.perform((db) {
      db.execute('''CREATE TABLE IF NOT EXISTS user (
      id INTEGER PRIMARY KEY AUTOINCREMENT default(0),
      account TEXT NOT NULL,
      password TEXT NOT NULL,
      name TEXT NOT NULL,
      avatar TEXT NOT NULL
      )''');
    });
  }
}
