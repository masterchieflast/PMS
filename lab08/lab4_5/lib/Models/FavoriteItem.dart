import 'package:hive/hive.dart';

part 'FavoriteItem.g.dart';

@HiveType(typeId: 1)
class FavoriteItem extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  FavoriteItem(this.title, this.description);
}
