import 'package:flutter/material.dart';
import 'package:layout_design/components/d_popButton.dart';

class DPopbox extends StatefulWidget {
  final Color initialRingcolor;
  final String titleNum;
  bool accepted;

  DPopbox({
    Key? key,
    this.initialRingcolor = const Color.fromARGB(255, 225, 225, 225),
    required this.titleNum,
    this.accepted = false,
  }) : super(key: key);

  @override
  State<DPopbox> createState() => _DPopboxState();
}

class _DPopboxState extends State<DPopbox> {
  late Color ringcolor;

  @override
  void initState() {
    super.initState();
    ringcolor = widget.initialRingcolor;
  }

  void changeColor() {
    setState(() {
      if (ringcolor == const Color.fromARGB(255, 225, 225, 225)) {
        ringcolor = Colors.green;
      } else {
        ringcolor = const Color.fromARGB(255, 225, 225, 225);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Material(
          elevation: 2,
          borderRadius: BorderRadius.circular(6),
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: MediaQuery.of(context).size.width * 0.016,),
                        CircleAvatar(
                          backgroundColor: ringcolor,
                          radius: MediaQuery.of(context).size.width * 0.0825,
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: MediaQuery.of(context).size.width * 0.072,
                            child: Icon(
                              Icons.person,
                              size: MediaQuery.of(context).size.width * 0.128,
                            ),
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width * 0.018,),
                        Text(
                          widget.titleNum,
                          style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: MediaQuery.of(context).size.width * 0.032
                          ),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width * 0.02,),
                        Text(
                          "Internal Medicine",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.029),
                        ),
                        Text(
                          "Alicia District Hospital",
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.029),
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width * 0.048,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.shield, color: Colors.orange, size: MediaQuery.of(context).size.width * 0.046),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.10,),
                            Icon(Icons.email, color: Colors.orange, size: MediaQuery.of(context).size.width * 0.046),
                            SizedBox(width: MediaQuery.of(context).size.width * 0.10,),
                            Icon(Icons.local_hospital, color: Colors.teal, size: MediaQuery.of(context).size.width * 0.046),
                          ],
                        ),
                        SizedBox(height: MediaQuery.of(context).size.width * 0.052,),
                        DPopbutton(text: "View Profile", onTap: changeColor, color: Colors.blueGrey),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 10,
          right: 10,
          child: Icon(
            Icons.more_vert,
            size: MediaQuery.of(context).size.width * 0.06,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}
