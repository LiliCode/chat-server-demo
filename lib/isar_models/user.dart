import 'dart:convert';

import 'package:isar/isar.dart';

part 'user.g.dart';

@Collection()
class User {
  Id id = Isar.autoIncrement;
  String? name;
  String? avatar;
  String? account;
  String? password;

  User({this.name, this.account, this.avatar, this.password});

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['avatar'] = avatar;
    data['account'] = account;

    return data;
  }

  @override
  String toString() => jsonEncode(toJson());
}
