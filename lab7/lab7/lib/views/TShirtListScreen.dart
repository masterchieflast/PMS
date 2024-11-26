import 'package:flutter/material.dart';
import 'package:lab7/views/FileSystemScreen.dart';
import 'package:lab7/views/TShirtScreen.dart';
import '../data/db.dart';
import '../data/TShirt.dart';

class TShirtListScreen extends StatefulWidget {
  @override
  _TShirtListScreenState createState() => _TShirtListScreenState();
}

class _TShirtListScreenState extends State<TShirtListScreen> {
  late Future<List<TShirt>> _tshirts;

  @override
  void initState() {
    super.initState();
    _tshirts = DatabaseHelper().getTShirts();
  }

  void _refreshTShirts() {
    setState(() {
      _tshirts = DatabaseHelper().getTShirts();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
        'Список футболок',
        style: TextStyle(color: Colors.white),
      ),
        backgroundColor: Colors.pink,

        actions: [
          IconButton(
            icon: const Icon(Icons.file_copy_outlined),
            color: Colors.white,
            tooltip: 'Работа с файлами',
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FileSystemScreen()),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            color: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const TShirtScreen()),
              ).then((_) => _refreshTShirts());
            },
          ),
        ],
      ),
      body: FutureBuilder<List<TShirt>>(
        future: _tshirts,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Ошибка: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Нет футболок'));
          } else {
            final tshirts = snapshot.data!;
            return SingleChildScrollView(
              child: ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: tshirts.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.pink),
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(8.0),
                      title: Text(tshirts[index].color),
                      subtitle: Text(tshirts[index].isPrint ? 'С принтом' : 'Без принта'),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TShirtScreen(tshirt: tshirts[index]),
                          ),
                        ).then((_) => _refreshTShirts());
                      },
                    ),
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}
