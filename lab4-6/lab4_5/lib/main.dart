import 'package:flutter/material.dart';
import 'package:lab4_5/HomeScreen/CardBlock.dart';
import 'package:lab4_5/HomeScreen/HeaderItem.dart';
import 'package:lab4_5/HomeScreen/TextBlock.dart';
import 'package:lab4_5/HomeScreen/TimeBlock.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FirstScreen(),
    );
  }
}

class FirstScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HeaderItem(),
            TextBlock(),
            CardBlock(),
            TimeBlock(),
          ],
        ),
      ),
    );
  }
}


