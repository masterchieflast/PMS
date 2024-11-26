import 'fashion_item.dart';

class Clothing extends FashionItem {
  String size;
  String material;

  Clothing(String name, double price, this.size, this.material)
      : super(name, price);

  @override
  void showInfo() {
    print('Clothing: $name, Price: \$$price, Size: $size, Material: $material');
  }
}
