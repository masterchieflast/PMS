import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lab4_5/NFTScreen/CardsBlock.dart';
import 'package:lab4_5/NFTScreen/HeaderBlock.dart';
import 'package:lab4_5/NFTScreen/TextBlock.dart';
import 'package:lab4_5/NFTScreen/UserSelector.dart';
import 'package:lab4_5/NFTScreen/VolumeBlock.dart';

import '../Common/CustomButton.dart';
import '../Common/TwoButtonsItem.dart';
import '../models/Product.dart';
import '../models/HiveService.dart';
import 'ProductEditor.dart';

class NFTScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Box<Product> abb = HiveService.productBox;
    // Получение списка продуктов
    List<Product> products = HiveService.productBox.values.toList();

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fon.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderBlock(),
                TextBlock(),
                CardsBlock(products: products),
                VolumeBlock(),

                // Кнопка для перехода на экран добавления нового продукта
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomButton(
                    icon: Icons.add,
                    iconColor: Colors.white,
                    backgroundColor: Colors.black.withOpacity(0.6),
                    onPressed: () {
                      // Переход на экран добавления нового продукта
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductEditor(),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

