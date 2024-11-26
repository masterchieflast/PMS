import 'package:flutter/material.dart';
import 'package:lab4_5/Models/HiveService.dart';
import 'package:lab4_5/Models/Product.dart';

class ProductEditor extends StatefulWidget {
  final Product? product;

  ProductEditor({this.product});

  @override
  _ProductEditorState createState() => _ProductEditorState();
}

class _ProductEditorState extends State<ProductEditor> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _titleController;
  late TextEditingController _descriptionController;
  late TextEditingController _priceController;
  late TextEditingController _imageUrlController;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.product?.title ?? '');
    _descriptionController = TextEditingController(text: widget.product?.description ?? '');
    _priceController = TextEditingController(text: widget.product?.price.toString() ?? '');
    _imageUrlController = TextEditingController(text: widget.product?.imageUrl ?? '');
  }

  @override
  Widget build(BuildContext context) {
    // Получаем текущего пользователя
    final currentUser = HiveService.getCurrentUser();

    // Если пользователь не админ, то закрываем доступ к редактированию
    if (currentUser.role != 'admin') {
      return Scaffold(
        appBar: AppBar(
          title: Text('Access Denied'),
        ),
        body: Center(child: Text('You are not authorized to edit products.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.product == null ? 'Add Product' : 'Edit Product'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(labelText: 'Title'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a title';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Description'),
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Price'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _imageUrlController,
                decoration: InputDecoration(labelText: 'Image URL'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final newProduct = Product(
                      title: _titleController.text,
                      description: _descriptionController.text,
                      price: double.tryParse(_priceController.text) ?? 0.0,
                      imageUrl: _imageUrlController.text,
                    );

                    if (widget.product != null) {
                      widget.product!
                        ..title = newProduct.title
                        ..description = newProduct.description
                        ..price = newProduct.price
                        ..imageUrl = newProduct.imageUrl
                        ..save();
                    } else {
                      HiveService.addProduct(newProduct);
                    }

                    Navigator.pop(context);
                  }
                },
                child: Text(widget.product == null ? 'Add' : 'Save'),
              ),
              if (widget.product != null) ...[
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    HiveService.deleteProduct(widget.product!);
                    Navigator.pop(context);
                  },
                  child: Text('Delete Product'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
