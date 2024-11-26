import 'package:flutter/material.dart';
import 'package:lab4_5/Common/TimeLine.dart';

class TimeBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 10),
      child: TimeLine(
        hours: 00,
        minutes: 29,
        seconds: 14,
        fontSize: 72,
        color: Colors.black,
      ),
    );
  }
}
