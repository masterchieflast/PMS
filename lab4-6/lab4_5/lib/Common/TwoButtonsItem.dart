import 'package:flutter/material.dart';

class TwoButtonsItem extends StatelessWidget {
  final Color firstButtonTextColor;
  final Color firstButtonBorderColor;

  const TwoButtonsItem({
    Key? key,
    required this.firstButtonTextColor,
    required this.firstButtonBorderColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Первая кнопка
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.transparent,
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: BorderSide(color: firstButtonBorderColor, width: 2.0),
            ),
            padding: const EdgeInsets.all(10.0),
            minimumSize: const Size(140, 45),
          ),
          onPressed: () {},
          child: Text(
            "@laydesigner",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: firstButtonTextColor,
            ),
          ),
        ),
        const SizedBox(width: 5),
        // Вторая кнопка
        ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50.0),
              side: const BorderSide(color: Colors.black, width: 2.0),
            ),
            padding: const EdgeInsets.all(10.0),
            minimumSize: const Size(70, 45),
          ),
          onPressed: () {},
          child: const Text(
            "New",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Colors.white,
            ),
          ),
        ),
        const SizedBox(width: 30),
      ],
    );
  }
}
