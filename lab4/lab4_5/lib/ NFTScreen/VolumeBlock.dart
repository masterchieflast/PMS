import 'package:flutter/material.dart';

import '../Common/CustomButton.dart';
import '../main.dart';

class VolumeBlock extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(130, 20, 0, 0),
      child: Row(
        children: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              // 1-й блок
              Positioned(
                left: -140,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 160,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.5),
                      borderRadius: BorderRadius.circular(50.0),
                    ),
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.currency_bitcoin_sharp, size: 40, color: Colors.white),
                              SizedBox(width: 10),
                              Column(
                                children: [
                                  Text(
                                    "785",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.normal,
                                      height: 1.2,
                                    ),
                                  ),
                                  Text(
                                    "Volume",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w300,
                                      height: 1.2,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              // 2-й блок
              Positioned(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: CustomButton(
                    icon: Icons.show_chart,
                    backgroundColor: Colors.white,
                    iconColor: Colors.black,
                    iconSize: 40,
                    buttonSize:70,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => FirstScreen()),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
