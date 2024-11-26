import 'fashion_item.dart';

class Accessory extends FashionItem {
  String type;

  Accessory(String name, double price, this.type) : super(name, price);

  @override
  void showInfo() {
    print('Accessory: $name, Price: \$$price, Type: $type');
  }
}
