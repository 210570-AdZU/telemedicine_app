import 'package:flutter/material.dart';
import 'package:get/get.dart';
class AddminButton extends StatefulWidget {
  AddminButton({Key? key});

  @override
  State<AddminButton> createState() => _ButtonState();
}

class _ButtonState extends State<AddminButton> {

  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed('/registernew'),
      child: MouseRegion(
        onEnter: (_) {
          setState(() {
            isHovered = true;
          });
        },
        onExit: (_) {
          setState(() {
            isHovered = false;
          });
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Material(
            elevation: 2,
            borderRadius: BorderRadius.circular(32),
            color: isHovered ? Colors.green : Colors.blueGrey,
            child: Container(
              constraints: BoxConstraints(minWidth: 0, minHeight: 0),
              padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(32),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.add,
                        color: Colors.blueGrey,
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Text(
                    "Admin",
                    style: TextStyle(
                      color: isHovered ? Colors.white : Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}