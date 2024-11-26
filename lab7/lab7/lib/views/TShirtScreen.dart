import 'package:flutter/material.dart';
import '../data/TShirt.dart';
import '../data/db.dart';

class TShirtScreen extends StatefulWidget {
  final TShirt? tshirt;

  const TShirtScreen({Key? key, this.tshirt}) : super(key: key);

  @override
  _TShirtScreenState createState() => _TShirtScreenState();
}

class _TShirtScreenState extends State<TShirtScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _color;
  late bool _isPrint;
  late double _price;

  @override
  void initState() {
    super.initState();
    if (widget.tshirt != null) {
      _color = widget.tshirt!.color;
      _isPrint = widget.tshirt!.isPrint;
      _price = widget.tshirt!.price;
    } else {
      _color = '';
      _isPrint = false;
      _price = 10.0;
    }
  }

  void _saveTShirt() {
    if (_formKey.currentState!.validate()) {
      final tshirt = TShirt(
        _color,
        _isPrint,
        _price,
        id: widget.tshirt?.id,
      );

      if (widget.tshirt == null) {
        DatabaseHelper()
            .insertTShirt(tshirt)
            .then((_) => Navigator.pop(context));
      } else {
        DatabaseHelper()
            .updateTShirt(tshirt)
            .then((_) => Navigator.pop(context));
      }
    }
  }

  void _deleteTShirt() {
    if (widget.tshirt != null) {
      DatabaseHelper()
          .deleteTShirt(widget.tshirt!.id!)
          .then((_) => Navigator.pop(context));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.tshirt == null ? 'Добавить футболку' : 'Редактировать футболку',
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Цвет',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.all(5),
                  ),
                  initialValue: _color,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите цвет';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _color = value;
                  },
                ),
              ),
              const SizedBox(height: 16),
              SwitchListTile(
                title: const Text('Наличие принта'),
                value: _isPrint,
                onChanged: (value) {
                  setState(() {
                    _isPrint = value;
                  });
                },
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.pink),
                  borderRadius: BorderRadius.circular(8.0),

                ),
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: 'Цена',
                    border: InputBorder.none,

                    contentPadding: EdgeInsets.all(5),
                  ),
                  initialValue: _price.toString(),
                  keyboardType: TextInputType.number,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Пожалуйста, введите цену';
                    }
                    final parsedValue = double.tryParse(value);
                    if (parsedValue == null || parsedValue <= 0) {
                      return 'Пожалуйста, введите корректную цену';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    _price = double.tryParse(value) ?? 0.0;
                  },
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    onPressed: _saveTShirt,
                    child: const Text(
                      'Сохранить',
                      style: TextStyle(color: Colors.pink),
                    ),
                  ),
                  if (widget.tshirt != null)
                    ElevatedButton(
                      onPressed: _deleteTShirt,
                      style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                      child: const Text(
                        'Удалить',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
