import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageNotif extends StatelessWidget {
  const MessageNotif({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.only(left: 2, right: 2, top: 2),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    "New Account",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black54
                    ),
                  ),
                  Spacer(),
                  Text(
                    "7 days",
                    style: TextStyle(
                      fontSize: 12
                    ),
                  )
                ],
              ),
              Text(
                "New account has been registered from Camp Navarro Hospital named Reejay",
                style: TextStyle(
                  fontSize: 10
                ),
                )
            ],
          ),
        ),
      ),
    );
  }
}