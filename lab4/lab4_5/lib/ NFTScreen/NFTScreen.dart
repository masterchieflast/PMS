import 'package:flutter/material.dart';
import 'package:lab4_5/%20NFTScreen/CardsBlock.dart';
import 'package:lab4_5/%20NFTScreen/HeaderBlock.dart';
import 'package:lab4_5/%20NFTScreen/TextBlock.dart';
import 'package:lab4_5/%20NFTScreen/VolumeBlock.dart';

import '../Common/TwoButtonsItem.dart';

class NFTScreen extends StatelessWidget {
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
          child: Padding(padding: EdgeInsets.fromLTRB(10, 10, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeaderBlock(),
                TextBlock(),
                CardsBlock(),
                VolumeBlock(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


