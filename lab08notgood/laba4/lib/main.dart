import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:laba4/ProductManagmentScreen.dart';
import 'package:laba4/UserSelectionScreen.dart';
import 'package:laba4/service/userService.dart';
import 'package:provider/provider.dart';
import 'HomeScreen/presentation//BottomSheet.dart';

import 'favoriteScreen.dart';
import 'models/favoriteItem.dart';
import 'models/product.dart';
import 'models/user.dart';
import 'package:laba4/userProvider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  Hive.registerAdapter(ProductAdapter());
  Hive.registerAdapter(FavoriteItemAdapter());

  await Hive.openBox<User>('users');
  await Hive.openBox<Product>('products');
  await Hive.openBox<FavoriteItem>('favorites');
  await Hive.openBox<int>('current_user');

  await initializeData();

  runApp(
      ChangeNotifierProvider(
          create: (context) => UserProvider(),
          child: MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}


class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final UserService userService = UserService();
  late Future<User?> _currentUserFuture;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
  }

  void _loadCurrentUser() {
    setState(() {
      _currentUserFuture = Future.value(userService.getCurrentUser());
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<User?>(
      future: _currentUserFuture,
      builder: (context, snapshot) {
        if (!snapshot.hasData) return CircularProgressIndicator();
        final currentUser = snapshot.data;

        if (currentUser == null) {
          return UserSelectionScreen();
        }

        return Scaffold(
          appBar: AppBar(
            title: Text('Home'),
            actions: [
              IconButton(
                icon: Icon(Icons.favorite),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => FavoritesScreen()),
                  );
                  _loadCurrentUser(); // Обновляем данные при возврате
                },
              ),
              IconButton(
                icon: Icon(Icons.person),
                onPressed: () async {
                  await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserSelectionScreen()),
                  );
                  _loadCurrentUser(); // Обновляем данные при возврате
                },
              ),
            ],
          ),
          body: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 10.0),
                ElevatedButton(
                  onPressed: () {
                    if (currentUser.isAdminOrManager) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductManagementScreen(),
                        ),
                      );
                    } else {
                      print("User is not an admin or manager");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
                  ),
                  child: Text('Управление', style: TextStyle(fontSize: 16.0)),
                ),
                SizedBox(height: 20.0),
                Expanded(child: BottomSheetBlock()), // Основной блок с контентом
                SizedBox(height: 20.0),
              ],
            ),
          ),
        );
      },
    );
  }
}

Future<void> initializeData() async {
  final userBox = Hive.box<User>('users');
  final productBox = Hive.box<Product>('products');
  final favoriteBox = Hive.box<FavoriteItem>('favorites');
  final currentUserBox = Hive.box<int>('current_user');

  if (userBox.isEmpty) {
    userBox.addAll([
      User(id: 1, name: 'Admin User', role: 'admin'),
      User(id: 2, name: 'Manager User', role: 'manager'),
      User(id: 3, name: 'Regular User', role: 'user'),
    ]);
  }

  if (productBox.isEmpty) {
    productBox.addAll([
      Product(name: 'Product 1', description: 'Description for Product 1', price: 99.99, imageUrl: 'assets/images/fon1.jpg'),
      Product(name: 'Product 2', description: 'Description for Product 2', price: 149.99, imageUrl: 'assets/images/fon1.jpg'),
      Product(name: 'Product 3', description: 'Description for Product 3', price: 199.99, imageUrl: 'assets/images/fon1.jpg'),
    ]);
  }
  if (currentUserBox.isEmpty) {
    final defaultUser = userBox.values.firstWhere((user) => user.role == 'user');
    await currentUserBox.put('currentUserId', defaultUser.id);
  }

  if (favoriteBox.isEmpty) {
    favoriteBox.add(FavoriteItem(userId: 1, productId: 1));
  }
}


