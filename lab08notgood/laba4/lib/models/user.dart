import 'package:hive/hive.dart';
part 'user.g.dart';


@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String role;

  User({required this.id, required this.name, required this.role});

  bool get isAdminOrManager => role == 'admin' || role == 'manager';
}