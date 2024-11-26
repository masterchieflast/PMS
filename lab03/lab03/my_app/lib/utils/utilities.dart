import '../interfaces/discountable.dart';

void applyDiscountSafely(Discountable item, double discount) {
  try {
    item.applyDiscount(percent: discount);
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}
