import 'package:flutter/material.dart';
import 'package:lab4_5/NFTScreen/NFTScreen.dart';

import '../Common/TwoButtonsItem.dart';

class TextBlock extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return const Padding(
      padding: EdgeInsets.fromLTRB(10, 20, 10, 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'EXPLORE',
            style: TextStyle(fontSize: 64, fontWeight: FontWeight.w500, height: 0.9, ),
          ),
          Row(
            children: [
              Text(
                'THE🔥',
                style: TextStyle(fontSize: 64, fontWeight: FontWeight.w500, height: 0.9, ),
              ),
              Text(
                'MOST',
                style: TextStyle(fontSize: 64, fontWeight: FontWeight.w500, height: 0.9, ),
              ),
            ],
          ),
          Text(
            'POPULAR',
            style: TextStyle(fontSize: 64, fontWeight: FontWeight.w500, height: 0.95, ),
          ),
          Row(
            children: [
              TwoButtonsItem(firstButtonTextColor: Colors.black, firstButtonBorderColor: Colors.black,),
              Text(
                'NFT.',
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w500,
                  height: 0.9,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}