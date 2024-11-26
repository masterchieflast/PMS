import 'package:flutter/material.dart';
import 'package:lab4_5/%20NFTScreen/BatteryInfoBlock.dart';
import 'package:lab4_5/%20NFTScreen/CardsBlock.dart';
import 'package:lab4_5/%20NFTScreen/HeaderBlock.dart';
import 'package:lab4_5/%20NFTScreen/TextBlock.dart';
import 'package:lab4_5/%20NFTScreen/VolumeBlock.dart';

import '../Common/TwoButtonsItem.dart';

class NFTScreen extends StatelessWidget {
  final String data;

  const NFTScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/fon.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderBlock(),
                TextBlock(),
                CardsBlock(),
                VolumeBlock(),
                Text("$data", style: TextStyle(color: Colors.white)),
                BatteryInfoBlock(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
