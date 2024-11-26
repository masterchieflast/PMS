import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'TShirt.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;

  static Database? _database;

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'tshirts.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE tshirts(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        color TEXT NOT NULL,
        isPrint INTEGER NOT NULL,
        price REAL NOT NULL        
      )
    ''');
  }

  Future<int> insertTShirt(TShirt tshirt) async {
    final db = await database;
    return await db.insert('tshirts', {
      'color': tshirt.color,
      'isPrint': tshirt.isPrint ? 1 : 0, // bool в int
      'price': tshirt.price,
    });
  }

  Future<int> updateTShirt(TShirt tshirt) async {
    final db = await database;
    return await db.update(
      'tshirts',
      {
        'color': tshirt.color,
        'isPrint': tshirt.isPrint ? 1 : 0,
        'price': tshirt.price,
      },
      where: 'id = ?',
      whereArgs: [tshirt.id],
    );
  }

  Future<int> deleteTShirt(int id) async {
    final db = await database;
    return await db.delete(
      'tshirts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<List<TShirt>> getTShirts() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('tshirts');

    return List.generate(
      maps.length,
          (i) => TShirt(
        maps[i]['color'],
        maps[i]['isPrint'] == 1, // int обратно в bool
        maps[i]['price'],
        id: maps[i]['id'],
      ),
    );
  }
}
