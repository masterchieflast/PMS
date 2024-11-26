
import 'package:flutter/material.dart';
import 'package:lab4_5/Common/CustomButton.dart';
import 'package:lab4_5/main.dart';

class HeaderBlock extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          CustomButton(
            icon: Icons.arrow_back_ios,
            backgroundColor: Colors.white,
            iconColor:Colors.black,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FirstScreen()),
              );
            },
          ),
          SizedBox(
            width: 110,
            height: 60,
            child: Stack(
              children: [
                Positioned(
                  left: 50,
                  child: CustomButton(
                    icon: Icons.bookmark_border,
                    iconColor: Colors.white,
                    iconSize: 26,
                    backgroundColor: Colors.black.withOpacity(0.3),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FirstScreen()),
                      );
                    },
                  ),
                ),
                Positioned(
                  left: 0,
                  child: CustomButton(
                    icon: Icons.favorite_border,
                    backgroundColor: Colors.white,
                    iconColor: Colors.black,
                    iconSize: 26,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FirstScreen()),
                      );
                    },
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}