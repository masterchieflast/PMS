import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final IconData icon;
  final Color backgroundColor;
  final Color iconColor;
  final VoidCallback onPressed;
  final double? iconSize;
  final double? buttonSize;

  const CustomButton({
    Key? key,
    required this.icon,
    required this.backgroundColor,
    required this.iconColor,
    required this.onPressed,
    this.iconSize,
    this.buttonSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          padding: const EdgeInsets.all(15),
          minimumSize: Size(buttonSize ?? 60, buttonSize ?? 60),
          backgroundColor: backgroundColor,
        ),
        child: Icon(
          icon,
          size: iconSize ?? 18,
          color: iconColor,
        ),
      ),
    );
  }
}
