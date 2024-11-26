import 'package:hive/hive.dart';

part 'Product.g.dart';

@HiveType(typeId: 2)
class Product extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String description;

  @HiveField(2)
  double price;

  @HiveField(3)
  String imageUrl;

  Product({required this.title, required this.description, required this.price, required this.imageUrl});
}
