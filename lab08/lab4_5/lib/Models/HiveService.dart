import 'package:hive/hive.dart';

import 'FavoriteItem.dart';
import 'Product.dart';
import 'User.dart';

class HiveService {
  static final Box<User> userBox = Hive.box<User>('users');
  static final Box<FavoriteItem> favoriteBox = Hive.box<FavoriteItem>('favorites');
  static final Box<Product> productBox = Hive.box<Product>('products');

  static late User currentUser = User("admin", "admin");

  // Пользователи
  static void addUser(User user) => userBox.add(user);
  static List<User> getAllUsers() => userBox.values.toList();

  // Избранное
  static void addFavorite(FavoriteItem item) => favoriteBox.add(item);
  static List<FavoriteItem> getFavorites() => favoriteBox.values.toList();

  // Продукты
  static void addProduct(Product product) => productBox.add(product);
  static List<Product> getAllProducts() => productBox.values.toList();

  static void setCurrentUser(User user) {
    currentUser = user;}


  static void deleteProduct(Product product) => productBox.delete(product.key);


  // Получение текущего пользователя
  static User getCurrentUser() {
    return currentUser;
  }
}
