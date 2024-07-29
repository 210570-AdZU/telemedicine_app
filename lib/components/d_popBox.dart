import 'package:flutter/material.dart';
import 'package:layout_design/components/d_popButton.dart';

class DPopbox extends StatefulWidget {
  final Color initialRingcolor;
  final String accountName;
  final String hospital;
  final String specialization;
  final void Function()? onPressed;
  bool accepted;

  DPopbox({
    Key? key,
    this.initialRingcolor = const Color.fromARGB(255, 225, 225, 225),
    required this.accountName,
    required this.hospital,
    required this.specialization,
    this.accepted = false,
    this.onPressed
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
                          textAlign: TextAlign.center,
                          widget.accountName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: MediaQuery.of(context).size.width * 0.032
                          ),
                        ),
                        Spacer(),
                        Text(
                          textAlign: TextAlign.center,
                          widget.specialization,
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.029),
                        ),
                        Text(
                          textAlign: TextAlign.center,
                          widget.hospital,
                          style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.029),
                        ),
                        Spacer(),
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
                        SizedBox(height: MediaQuery.of(context).size.width * 0.04,),
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
          child: PopupMenuButton(
            icon: Icon(
              Icons.more_vert,
              size: MediaQuery.of(context).size.width * 0.045,
            ),
            itemBuilder: (BuildContext context) => <PopupMenuEntry<int>>[
              PopupMenuItem<int>(
                value: 1,
                onTap: widget.onPressed,
                child: Row(
                  children: [
                    Icon(
                      Icons.delete,
                      color: Colors.black45,
                      size: MediaQuery.of(context).size.width * 0.05,
                    ),
                    SizedBox(width: 10),
                    Text('Delete this account'),
                  ],
                ),
              ),
            ]
          )
        ),
      ],
    );
  }
}
