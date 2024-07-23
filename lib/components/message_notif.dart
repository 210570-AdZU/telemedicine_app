import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:layout_design/controllers/first_page_controller.dart';

class MessageNotif extends StatefulWidget {
  MessageNotif({Key? key}) : super(key: key);

  @override
  State<MessageNotif> createState() => _MessageNotifState();
}

class _MessageNotifState extends State<MessageNotif> {
  FirstPageController controller = Get.find<FirstPageController>();
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
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
      child: GestureDetector(
        onTap: () => {
          controller.notifOut(),
          Get.toNamed('/chatroom')
        },
        child: Container(
          decoration: BoxDecoration(
            color: isHovered ? Colors.black12 : Colors.transparent,
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 4, bottom: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.black54,
                  radius: 24,
                  child: Stack(
                    children: [
                      Center(
                        child: 
                          Text(
                            "TA",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white
                            ),
                          ),
                      ),
                      Stack(
                        children: [
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: CircleAvatar(
                              radius: 8,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                backgroundColor: Colors.black54,
                                radius: 6,
                              )
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Tristan Jay Amit",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black54
                        ),
                      ),
                      SizedBox(height: 8,),
                      Text(
                        "Test",
                        style: TextStyle(
                          fontSize: 11,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  "7 days ago",
                  style: TextStyle(
                    fontSize: 10,
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
