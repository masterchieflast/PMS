import 'interfaces/discountable.dart';
import 'models/clothing.dart';
import 'models/accessory.dart';
import 'models/fashion_item.dart';
import 'models/sneaker.dart';
import 'utils/utilities.dart';

void main() {
  // массив
  var items = <FashionItem>[
    Sneaker('AirMax', 150, 'M', 'Leather', 'Nike'),
    Clothing('T-Shirt', 30, 'L', 'Cotton'),
    Accessory('WatchRitch', 2000, 'Analog'),
    Accessory('Watch', 200, 'Analog')
  ];

  items.forEach((item) => item.showInfo());

  // множество
  var brands = {'Nike', 'Adidas', 'Puma'};
  brands.add('Reebok');
  brands.add('Reebok');
  print(brands);

  iterateItems(items);

  applyDiscountSafely(items[0] as Discountable, 20);
  (items[0] as Sneaker).showInfo();

  applyDiscountSafely(items[0] as Discountable, 200);
}

void iterateItems(/*коллекция*/ List<FashionItem> items) {
  for (var item in items) {
    if (item.price < 50) {
      continue;
    }
    item.showInfo();
    if (item.price > 1000) {
      break;
    }
  }
}
