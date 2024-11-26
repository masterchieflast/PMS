import 'package:flutter/material.dart';
import 'package:lab7/data/db.dart';
import 'package:lab7/domain/fileService.dart';
import 'package:lab7/data/TShirt.dart';

class FileSystemScreen extends StatefulWidget {
  @override
  _FileSystemScreenState createState() => _FileSystemScreenState();
}

class _FileSystemScreenState extends State<FileSystemScreen> {
  final FileService _fileService = FileService();
  bool _isLoading = false;
  String _error = '';
  Map<String, List<TShirt>> _loadedTShirts = {};

  final List<String> _directories = [
    'Temporary',
    'Application Support',
    'Application Library',
    'Application Documents',
    'Application Cache',
    'External Storage',
    'External Cache Directories',
    'External Storage Directories',
    'Downloads',
  ];

  Future<void> _writeTShirts(String dirType) async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final allTShirts = await DatabaseHelper().getTShirts();

      final language = _fileService.directoryLanguageMap[dirType];
      if (language == null) {
        throw Exception('Язык для директории $dirType не определён.');
      }

      final filteredTShirts =
      allTShirts.where((shirt) => shirt.color.toLowerCase() == language.toLowerCase()).toList();

      if (filteredTShirts.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Нет футболок для цвета $language')),
        );
        return;
      }

      await _fileService.writeTShirtsToDirectory(dirType, filteredTShirts);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Данные успешно записаны в $dirType')),
      );
    } catch (e) {
      setState(() {
        _error = 'Ошибка при записи в $dirType: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Future<void> _readTShirts(String dirType) async {
    setState(() {
      _isLoading = true;
      _error = '';
    });

    try {
      final tshirts = await _fileService.readTShirtsFromDirectory(dirType);
      setState(() {
        _loadedTShirts[dirType] = tshirts;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Данные успешно считаны из $dirType')),
      );
    } catch (e) {
      setState(() {
        _error = 'Ошибка при чтении из $dirType: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  Widget _buildTShirtsList(String dirType) {
    final tshirts = _loadedTShirts[dirType] ?? [];
    if (tshirts.isEmpty) {
      return const Text('Нет данных для отображения');
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: tshirts.map((shirt) {
        return ListTile(
          title: Text(shirt.color),
          subtitle: Text('Цена: \$${shirt.price} (ID: ${shirt.id})'),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Работа с файловой системой для футболок', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (_error.isNotEmpty)
                Text(
                  _error,
                  style: const TextStyle(color: Colors.red),
                ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(), // Отключаем прокрутку у ListView
                itemCount: _directories.length,
                itemBuilder: (context, index) {
                  final dir = _directories[index];
                  final language = _fileService.directoryLanguageMap[dir] ?? 'Unknown';
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    shape: RoundedRectangleBorder(
                      side: const BorderSide(color: Colors.pink, width: 1), // Рамка карточки
                      borderRadius: BorderRadius.circular(20.0), // Закругление углов
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '$dir (${language})',
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Row(
                            children: [
                              ElevatedButton.icon(
                                onPressed: () => _writeTShirts(dir),
                                icon: const Icon(Icons.download_outlined, color: Colors.pink),
                                label: const Text('Записать', style: TextStyle(color: Colors.pink)),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton.icon(
                                onPressed: () => _readTShirts(dir),
                                icon: const Icon(Icons.upload_outlined, color: Colors.pink),
                                label: const Text('Считать', style: TextStyle(color: Colors.pink)),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          _loadedTShirts.containsKey(dir)
                              ? _buildTShirtsList(dir)
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
