abstract class FashionItem {
  int? id;  // Поле id для уникальной идентификации
  String color;

  FashionItem(this.color, {this.id});

  void showDetails();

  void wear() {
    print('Вы носите $color');
  }
}
