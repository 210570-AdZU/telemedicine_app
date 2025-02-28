import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Notif extends StatefulWidget {
  const Notif({super.key,});

  @override
  State<Notif> createState() => _NotifState();
}

class _NotifState extends State<Notif> {

  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      hoverColor: Colors.lightBlueAccent,
      focusColor: Colors.lightBlueAccent,
      highlightColor: Colors.lightGreenAccent,
      child: GestureDetector(
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
        child: Container(
          color: isHovered ? Colors.black12 : Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(left: 6, right: 6, top: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      "New Account",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey
                      ),
                    ),
                    Spacer(),
                    Text(
                      "7 days ago\n",
                      style: TextStyle(
                        fontSize: 11
                      ),
                    )
                  ],
                ),
                SizedBox(height: 4,),
                Text(
                  "New account has been registered from Camp Navarro Hospital named Reejay",
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.blueGrey
                  ),
                  )
              ],
            ),
          ),
        ),
      ),
    )
    );
  }
}