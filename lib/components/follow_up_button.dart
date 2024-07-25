import 'package:flutter/material.dart';
import 'package:get/get.dart';
class FollowUpButton extends StatefulWidget {
  FollowUpButton({super.key});

  @override
  State<FollowUpButton> createState() => _FollowUpButtonState();
}

class _FollowUpButtonState extends State<FollowUpButton> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(32),
        child: InkWell(
          onTap: () {
            print("test");
          },
          borderRadius: BorderRadius.circular(32),
          child: Container(
            constraints: BoxConstraints(minWidth: 0, minHeight: 0),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(32),
              color: Colors.blueGrey,
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
                      Icons.chat_sharp,
                      size: 18,
                      color: Colors.blueGrey,
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "Follow Up",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
