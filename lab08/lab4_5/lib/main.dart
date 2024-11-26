import "package:flutter/material.dart";
import 'package:lab4_5/HomeScreen/CardBlock.dart';
import 'package:lab4_5/HomeScreen/HeaderItem.dart';
import 'package:lab4_5/HomeScreen/TextBlock.dart';
import 'package:lab4_5/HomeScreen/TimeBlock.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'NFTScreen/UserSelector.dart';
import 'models/FavoriteItem.dart';
import 'models/HiveService.dart';
import 'models/Product.dart';
import 'models/User.dart';

void main() async{
  await Hive.initFlutter();
  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(FavoriteItemAdapter());
  Hive.registerAdapter(ProductAdapter());

  await Hive.openBox<User>('users');

  await Hive.openBox<FavoriteItem>('favorites');
  await Hive.openBox<Product>('products');
  try {
    final admin = User('admin', 'admin');
    final user = User('user','user');

    HiveService.addUser(admin);
    HiveService.addUser(user);
    // Возвращаем, что пользователи были добавлены
  } catch (e) {
    print('Error creating users: $e');
  }
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderItem(),
            TextBlock(),
            CardBlock(),
            TimeBlock(),
          ],
        ),
      ),
    );
  }
}


