import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

import '../../ProductScreen/presentation/ProductInfo.dart';
import '../../models/favoriteItem.dart';
import '../../models/product.dart';
import '../../service/favoriteService.dart';
import '../../service/userService.dart';
import '../../userProvider.dart';

class CardItem extends StatefulWidget {
  final Product product;

  CardItem({required this.product});

  @override
  _CardItemState createState() => _CardItemState();
}

class _CardItemState extends State<CardItem> {
  final FavoriteService favoriteService = FavoriteService();
  final UserService userService = UserService();
  bool isFavorite = false;

  @override
  void initState() {
    super.initState();
    _checkIfFavorite();
  }

  Future<void> _checkIfFavorite() async {
    final currentUser = userService.getCurrentUser();
    if (currentUser != null) {
      final productKey = widget.product.key as int?;
      if (productKey != null) {
        isFavorite = await favoriteService.isFavorite(currentUser.id, productKey);
        setState(() {});
      }
    }
  }

  Future<void> _toggleFavorite() async {
    final currentUser = userService.getCurrentUser();
    final productKey = widget.product.key as int?;
    if (currentUser != null && productKey != null) {
      if (isFavorite) {
        await favoriteService.removeFavorite(currentUser.id, productKey);
      } else {
        await favoriteService.addFavorite(currentUser.id, productKey);
      }
      setState(() {
        isFavorite = !isFavorite;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = Provider.of<UserProvider>(context).currentUser;

    return ValueListenableBuilder(
      valueListenable: Hive.box<FavoriteItem>('favorites').listenable(),  // Используем открытый box
      builder: (context, box, _) {
        return Container(
          width: double.infinity,
          height: 50.0,
          margin: const EdgeInsets.symmetric(vertical: 8.0),
          decoration: BoxDecoration(
            color: Colors.blue[50],
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 4.0,
                offset: Offset(2, 2),
              ),
            ],
            image: DecorationImage(
              image: AssetImage(widget.product.imageUrl),
              fit: BoxFit.cover,
            ),
          ),
          child: Stack(
            children: [
              if (currentUser != null) // Отображаем имя текущего пользователя
                Text(
                  currentUser.name,
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              Positioned(
                top: 8.0,
                right: 8.0,
                child: IconButton(
                  icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
                  color: isFavorite ? Colors.lightGreenAccent : Colors.white,
                  onPressed: () async {
                    await _toggleFavorite();
                    _checkIfFavorite(); // Перепроверяем статус
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.product.name,
                              style: TextStyle(fontSize: 16.0, color: Colors.white),
                            ),
                            Text(
                              '\$${widget.product.price}',
                              style: TextStyle(fontSize: 16.0, color: Colors.white),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductInfo(
                                  images: [widget.product.imageUrl],
                                  description: widget.product.description,
                                  textLeft: widget.product.name,
                                  textRight: '\$${widget.product.price}',
                                ),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                          ),
                          child: Text('Купить'),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
