import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:laba4/service/favoriteService.dart';
import 'package:laba4/service/productService.dart';
import 'package:laba4/service/userService.dart';

import 'models/favoriteItem.dart';
import 'models/product.dart';
class FavoritesScreen extends StatefulWidget {
  @override
  _FavoritesScreenState createState() => _FavoritesScreenState();
}

class _FavoritesScreenState extends State<FavoritesScreen> {
  final FavoriteService favoriteService = FavoriteService();
  final UserService userService = UserService();
  late Future<List<Product>> _favoritesFuture;

  @override
  void initState() {
    super.initState();
    final currentUser = userService.getCurrentUser();
    _favoritesFuture = favoriteService.getFavoritesForUser(currentUser!.id);
  }

  Future<void> _refreshFavorites() async {
    final currentUser = userService.getCurrentUser();
    setState(() {
      _favoritesFuture = favoriteService.getFavoritesForUser(currentUser!.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentUser = userService.getCurrentUser();
    return Scaffold(
      appBar: AppBar(title: Text('Favorites')),
      body: FutureBuilder<List<Product>>(
        future: _favoritesFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) return CircularProgressIndicator();
          if (snapshot.data!.isEmpty) return Center(child: Text('No favorites added.'));

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final product = snapshot.data![index];

              return ListTile(
                title: Text(product.name),
                subtitle: Text('\$${product.price.toStringAsFixed(2)}'),
                trailing: IconButton(
                  icon: Icon(Icons.delete, color: Colors.red),
                  onPressed: () async {
                    await favoriteService.removeFavorite(currentUser!.id, product.key as int);
                    await _refreshFavorites(); // Обновляем список после удаления
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
