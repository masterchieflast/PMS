
import 'package:flutter/material.dart';
import 'package:lab4_5/%20NFTScreen/CardItem.dart';
import 'package:lab4_5/Common/CustomButton.dart';
import 'package:lab4_5/main.dart';

import '../Common/TimeLine.dart';

class CardsBlock extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CardItem(
            icon: Icons.attach_money,
            labelText: "Floor price",
            mainNumber: 3.52,
            subNumber: 0.34,
            backgroundColor: Colors.white.withOpacity(1.0),
            textColor: Colors.black,
          ),
          SizedBox(width: 10),

          CardItem(
            icon: Icons.people_alt_outlined,
            labelText: "Sales",
            mainNumber: 3.52,
            subNumber: 0.34,
            backgroundColor: Colors.black.withOpacity(0.5),
            textColor: Colors.white,
          )

        ],
      ),


    );


  }
}