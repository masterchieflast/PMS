import 'package:flutter/material.dart';
import 'package:lab4_5/models/HiveService.dart';

class FavoritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final favorites = HiveService.getFavorites();

    return Scaffold(
      appBar: AppBar(
        title: Text("Favorites"),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, index) {
          final item = favorites[index];
          return ListTile(
            title: Text(item.title),
            subtitle: Text(item.description),
            trailing: IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                item.delete();
              },
            ),
          );
        },
      ),
    );
  }
}
