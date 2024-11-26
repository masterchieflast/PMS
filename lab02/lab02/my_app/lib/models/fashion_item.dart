abstract class FashionItem {
  String _name;
  double _price;

  static int itemCount = 0;

  String get name => _name;

  set name(String value) => _name = value;

  double get price => _price;

  set price(double value) {
    if (value < 0) {
      throw ArgumentError('Price cannot be negative.');
    }
    _price = value;
  }

  FashionItem(this._name, this._price) {
    itemCount++;
  }

  FashionItem.fromString(String data)
      : _name = data.split(',')[0],
        _price = double.parse(data.split(',')[1]);

  void showInfo();

  static void describeCategory() {
    print('This category includes fashion items.');
  }

  void printPrice([bool includeCurrency = true]) {
    if (includeCurrency) {
      print('Price: \$$_price');
    } else {
      print('Price: $_price');
    }
  }

  void processItem(void Function(FashionItem) processor) {
    processor(this);
  }

  void displayInfo(bool showPrice, [String? additionalInfo]) {
    showInfo();
    if (showPrice) {
      print('Price: \$$price');
    }
    if (additionalInfo != null) {
      print('Additional Info: $additionalInfo');
    }
  }
}
