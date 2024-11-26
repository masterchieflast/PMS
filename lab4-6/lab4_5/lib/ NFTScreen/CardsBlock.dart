import 'package:flutter/material.dart';
import 'package:lab4_5/%20NFTScreen/CardItem.dart';
class CardsBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
      child: Column(
        children: [
          Container(
            height: 170,
            child: PageView(
              scrollDirection: Axis.horizontal,
              children: [
                Row(
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
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CardItem(
                      icon: Icons.star,
                      labelText: "Favorites",
                      mainNumber: 12,
                      subNumber: 1,
                      backgroundColor: Colors.blue.withOpacity(0.5),
                      textColor: Colors.white,
                    ),
                    SizedBox(width: 10),
                    CardItem(
                      icon: Icons.trending_up,
                      labelText: "Trends",
                      mainNumber: 20,
                      subNumber: 5,
                      backgroundColor: Colors.grey.withOpacity(0.5),
                      textColor: Colors.white,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CardItem(
                      icon: Icons.attach_money,
                      labelText: "Floor price",
                      mainNumber: 3.52,
                      subNumber: 0.34,
                      backgroundColor: Colors.deepPurple.withOpacity(0.5),
                      textColor: Colors.white,
                    ),
                    SizedBox(width: 10),
                    CardItem(
                      icon: Icons.people_alt_outlined,
                      labelText: "Sales",
                      mainNumber: 5.52,
                      subNumber: 6.34,
                      backgroundColor: Colors.red.withOpacity(0.5),
                      textColor: Colors.white,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
