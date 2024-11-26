import 'package:flutter/material.dart';
import 'package:lab7/views/TShirtListScreen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lab7',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TShirtListScreen(),
    );
  }
}