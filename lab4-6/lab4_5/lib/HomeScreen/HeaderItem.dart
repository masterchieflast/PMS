
import 'package:flutter/material.dart';

class HeaderItem extends StatelessWidget{
@override
Widget build(BuildContext context) {
  return Container(

    child: const Padding(
      padding: EdgeInsets.all(16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'nolade.',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              //height: 1.2,
            ),
          ),

          SizedBox(width: 180,),
          Icon(Icons.add_chart, size: 22, color: Colors.black,),
          SizedBox(width: 10),
          Icon(Icons.settings, size: 22, color: Colors.black,),
          SizedBox(width: 16),
          CircleAvatar(
            radius: 20,
            backgroundColor: Colors.red,
          ),
            ],
      ),
    ),
  );


}
}