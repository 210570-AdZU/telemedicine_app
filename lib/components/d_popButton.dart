import 'package:flutter/material.dart';

class DPopbutton extends StatelessWidget {
  final String text;
  final void Function()? onTap;
  final Color color;
  const DPopbutton({
    super.key,
    required this.text,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: color,
        ),
        padding: const EdgeInsets.all(4),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 11,
              color: Colors.white
            ),
          ),
        ),
      ),
    );
  }
}