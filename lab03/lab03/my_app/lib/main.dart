import 'dart:async';

import 'models/clothing.dart';
import 'models/fashion_item.dart';
import 'models/sneaker.dart';

void main() async {
  print('Загрузка товаров...');
  var items = await loadFashionItems();
  items.forEach((item) => item.showInfo());

  listenToStreams(items);
}

Future<List<FashionItem>> loadFashionItems() async {
  return Future.delayed(Duration(seconds: 2), () {
    return [
      Sneaker('AirMax', 150, 'M', 'Leather', 'Nike'),
      Clothing('T-Shirt', 30, 'L', 'Cotton'),
    ];
  });
}

Stream<FashionItem> singleSubscriptionStream(List<FashionItem> items) async* {
  for (var item in items) {
    yield item;
  }
}

Stream<FashionItem> broadcastStream(List<FashionItem> items) {
  var controller = StreamController<FashionItem>.broadcast();
  for (var item in items) {
    controller.add(item);
  }
  return controller.stream;
}

void listenToStreams(List<FashionItem> items) async {
  print('Single subscription stream:');
  await for (var item in singleSubscriptionStream(items)) {
    item.showInfo();
  }

  print('Broadcast stream:');
  var broadcast = broadcastStream(items);
  broadcast.listen((item) => item.showInfo());
  broadcast.listen((item) => print('Received another broadcast: ${item.name}'));
}
