import 'package:flutter/material.dart';
import 'package:lab4_5/NFTScreen/CardItem.dart';
import 'package:lab4_5/Common/CustomButton.dart';
import 'package:lab4_5/main.dart';

import '../Common/TimeLine.dart';
import '../models/FavoriteItem.dart';
import '../models/HiveService.dart';
import '../models/Product.dart';

class CardsBlock extends StatelessWidget {
  final List<Product> products;

  CardsBlock({required this.products});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return Card(
            margin: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: ListTile(
              contentPadding: EdgeInsets.all(10),
              leading: Image(
                image: AssetImage(product.imageUrl), // Укажите путь к изображению в папке assets
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
              title: Text(product.title),
              subtitle: Text('${product.price} USD'),
              trailing: IconButton(
                icon: Icon(Icons.favorite_border, color: Colors.red),
                onPressed: () {
                  HiveService.addFavorite(
                      FavoriteItem(product.title, product.description));
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Added to favorites!')),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
