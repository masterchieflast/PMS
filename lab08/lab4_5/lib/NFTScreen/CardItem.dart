import 'package:flutter/material.dart';

class CardItem extends StatelessWidget {
  final IconData icon;
  final String labelText;
  final double mainNumber;
  final double subNumber;
  final Color backgroundColor;
  final Color textColor;

  const CardItem({
    Key? key,
    required this.icon,
    required this.labelText,
    required this.mainNumber,
    required this.subNumber,
    required this.backgroundColor,
    required this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(10),
      constraints: const BoxConstraints(
        minHeight: 165,
        minWidth: 140,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(icon, color: textColor),
              const SizedBox(width: 5),
              Text(
                labelText,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],

          ),
          const SizedBox(height: 36),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: Colors.deepOrangeAccent,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Text(
              '+${subNumber.toStringAsFixed(2)}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            mainNumber.toStringAsFixed(2),
            style: TextStyle(
              color: textColor,
              fontSize: 40,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
