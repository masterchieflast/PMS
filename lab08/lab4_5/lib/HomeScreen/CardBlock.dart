import 'package:flutter/material.dart';
import 'package:lab4_5/%20NFTScreen/NFTScreen.dart';
import 'package:lab4_5/Common/CustomButton.dart';

class CardBlock extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return
      Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(38),
              image: const DecorationImage(
                image: AssetImage('assets/fon1.jpg'),
                fit: BoxFit.cover,
              ),            ),


            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        // 2-й блок
                        Positioned(
                          left: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Container(
                              width: 100,
                              height: 60,
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
                                        Icon(Icons.currency_bitcoin_sharp, size: 28, color: Colors.white,),
                                        SizedBox(width: 5),
                                        Column(
                                          children: [
                                            Text(
                                              "785",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.normal,
                                                height: 1.2,
                                              ),
                                            ),
                                            Text(
                                              "Volume",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 10,
                                                fontWeight: FontWeight.w300,
                                                height: 1.2,
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        // 1-й блок
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50.0),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "25",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                // ТЕКСТ
                const Padding(
                  padding: EdgeInsets.fromLTRB(10, 60, 0, 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Monkey",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.normal,
                            height: 0.9
                        ),
                      ),
                      Text(
                        "Hypebeast",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.normal,
                          height: 0.9,
                        ),
                      ),
                    ],
                  ),
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //Закругленный блок
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: 160,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(50.0),

                        ),
                        child: const Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.people_alt_outlined, size: 22, color: Colors.white60,),
                              SizedBox(width: 5),
                              Text(
                                "+56",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                              SizedBox(width: 10),
                              Icon(Icons.shopping_bag, size: 20, color: Colors.white60,),
                              SizedBox(width: 4),
                              Text(
                                "+12",
                                style: TextStyle(
                                  color: Colors.white60,
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
//кнопка
                      CustomButton(
                        icon: Icons.arrow_forward_ios,
                        iconColor:Colors.black,
                        backgroundColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => NFTScreen()),
                          );
                        },
                      ),
                  ],
                ),
              ],
            )
        ),
      );
  }
}