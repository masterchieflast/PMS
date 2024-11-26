import 'package:hive/hive.dart';

part 'User.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  String name;

  @HiveField(1)
  String role; // Например: admin, manager, user

  User(this.name, this.role);
}
