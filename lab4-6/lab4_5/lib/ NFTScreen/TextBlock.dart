
import 'package:flutter/material.dart';
import 'package:lab4_5/Common/CustomButton.dart';
import 'package:lab4_5/main.dart';

import '../Common/TimeLine.dart';
import '../Common/TwoButtonsItem.dart';

class TextBlock extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            TwoButtonsItem(firstButtonTextColor: Colors.white, firstButtonBorderColor: Colors.white,),
            SizedBox(height: 20),
            Text(
              "Monkey",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                  fontWeight: FontWeight.w500,
                  height: 0.9
              ),
            ),
            Text(
              "Hypebeast",
              style: TextStyle(
                color: Colors.white,
                fontSize: 50,
                fontWeight: FontWeight.w500,
                height: 0.9,
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 30, 150, 40),
              child:
                TimeLine(
                  hours: 02,
                  minutes: 35,
                  seconds: 56,
                  fontSize: 44,
                  color:Colors.white,
                ),
            ),
          ],
        ),
    );
  }
}