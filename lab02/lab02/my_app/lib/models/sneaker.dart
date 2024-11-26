import 'clothing.dart';
import '../interfaces/discountable.dart';

class Sneaker extends Clothing implements Discountable{
  String brand;

  Sneaker(String name, double price, String size, String material, this.brand)
      : super(name, price, size, material);

  @override
  void showInfo() {
    print(
        'Sneaker: $name, Price: \$$price, Brand: $brand, Size: $size, Material: $material');
  }

  @override
  void applyDiscount({required double percent}) {
    if (percent < 0 || percent > 100) {
      throw ArgumentError('Discount percent must be between 0 and 100.');
    }
    price -= price * (percent / 100);
  }

}
