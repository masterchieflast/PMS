import 'dart:convert';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/foundation.dart';

import '../data/TShirt.dart';

class FileService {
  final Map<String, String> directoryLanguageMap = {
    'Temporary': 'T_Temporary',
    'Application Support': 'T_Support',
    'Application Library': 'T_Library',
    'Application Documents': 'T_Documents',
    'Application Cache': 'T_Cache',
    'External Storage': 'T_Storage',
    'External Cache Directories': 'T_External_Cache',
    'External Storage Directories': 'T_External_Storage',
    'Downloads': 'T_Downloads',
  };

  String _tshirtsToJson(List<TShirt> tshirts) {
    final List<Map<String, dynamic>> data =
    tshirts.map((tshirt) => tshirt.toJson()).toList();
    return jsonEncode(data);
  }

  List<TShirt> _jsonToTShirts(String jsonStr) {
    final List<dynamic> data = jsonDecode(jsonStr);
    return data.map((item) => TShirt.fromJson(item)).toList();
  }

  Future<Directory> _getDirectory(String dirType) async {
    try {
      switch (dirType) {
        case 'Temporary':
          return await getTemporaryDirectory();
        case 'Application Support':
          return await getApplicationSupportDirectory();
        case 'Application Library':
          return await getLibraryDirectory();
        case 'Application Documents':
          return await getApplicationDocumentsDirectory();
        case 'Application Cache':
          return await getApplicationCacheDirectory();
        case 'External Storage':
          return await getExternalStorageDirectory() ?? await getApplicationDocumentsDirectory();
        case 'External Cache Directories':
          return (await getExternalCacheDirectories())!.first;
        case 'External Storage Directories':
          return (await getExternalStorageDirectories())!.first;
        case 'Downloads':
          return await getDownloadsDirectory() ?? await getApplicationDocumentsDirectory();

        default:
          throw ArgumentError('Неизвестный тип директории: $dirType');
      }
    } catch (e) {
      debugPrint('Ошибка при получении директории $dirType: $e');
      throw Exception('Не удалось получить директорию для $dirType');
    }
  }

  // Запись в файл
  Future<void> writeTShirtsToDirectory(String dirType, List<TShirt> tshirts) async {
    try {
      final directory = await _getDirectory(dirType);
      final language = directoryLanguageMap[dirType] ?? 'Unknown';
      final filePath = '${directory.path}/tshirts_$language.json';
      final file = File(filePath);
      final jsonStr = _tshirtsToJson(tshirts);
      await file.writeAsString(jsonStr);
      if (kDebugMode) {
        print('Данные записаны в $filePath');
      }
    } catch (e) {
      debugPrint('Ошибка при записи в директорию $dirType: $e');
      throw Exception('Не удалось записать данные в директорию $dirType');
    }
  }

  // Чтение из файла
  Future<List<TShirt>> readTShirtsFromDirectory(String dirType) async {
    try {
      final directory = await _getDirectory(dirType);
      final language = directoryLanguageMap[dirType] ?? 'Unknown';
      final filePath = '${directory.path}/tshirts_$language.json';
      final file = File(filePath);
      if (await file.exists()) {
        final jsonStr = await file.readAsString();
        return _jsonToTShirts(jsonStr);
      } else {
        if (kDebugMode) {
          print('Файл не найден: $filePath');
        }
        return [];
      }
    } catch (e) {
      debugPrint('Ошибка при чтении из директории $dirType: $e');
      throw Exception('Не удалось прочитать данные из директории $dirType');
    }
  }
}
