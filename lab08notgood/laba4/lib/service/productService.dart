
import 'package:hive/hive.dart';
import '../models/product.dart';

class ProductService {

 final Box<Product> _productBox = Hive.box<Product>('products');

  Future<void> addProduct(Product product) async {
    await _productBox.add(product);
  }

  Future<void> updateProduct(int index, Product product) async {
    await _productBox.putAt(index, product);
  }

  Future<void> deleteProduct(int index) async {
    await _productBox.deleteAt(index);
  }

  Future<List<Product>> getAllProducts() async {
    return _productBox.values.toList();
  }
}
