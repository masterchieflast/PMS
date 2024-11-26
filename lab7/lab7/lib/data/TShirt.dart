import 'FashionItem.dart';


class TShirt extends FashionItem {
  bool isPrint;
  double price;

  TShirt(String color, this.isPrint, this.price, {int? id}) : super(color, id: id);

  @override
  void showDetails() {
    print('Футболка цвет: $color');
  }

  // Метод для сериализации объекта в JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'color': color,
      'isPrint': isPrint,
      'price': price,
    };
  }

  // Метод для десериализации из JSON
  factory TShirt.fromJson(Map<String, dynamic> json) {
    return TShirt(
      json['color'],
      json['isPrint'],
      (json['price'] as num).toDouble(),
      id: json['id'],
    );
  }
}