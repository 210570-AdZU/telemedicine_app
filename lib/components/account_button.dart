import 'package:flutter/material.dart';

class AccountButton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color color;
  late Color textColor;

  AccountButton({
    Key? key,
    required this.text,
    required this.onTap,
    required this.color,
    Color? initialTextColor,
  }) : super(key: key) {
    textColor = initialTextColor ?? Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: color,
        ),
        padding: const EdgeInsets.all(8),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: textColor,
            ),
          ),
        ),
      ),
    );
  }
}
