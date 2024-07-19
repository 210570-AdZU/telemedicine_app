import 'package:flutter/material.dart';

class CaseMidBox extends StatefulWidget {
  final String detail;
  final VoidCallback onTap;
  final IconData icon;
  final Color iconColor;

  const CaseMidBox({
    Key? key,
    required this.onTap,
    this.detail='',
    this.icon=Icons.person,
    this.iconColor=Colors.black
  }) : super(key: key);

  @override
  State<CaseMidBox> createState() => _CaseMidBoxState();
}

class _CaseMidBoxState extends State<CaseMidBox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(24), // This will match the Material's borderRadius
          child: Material(
            elevation: 3,
            borderRadius: BorderRadius.circular(4),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 4, vertical: 4),
                width: 132,
                height: 64,
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "45",
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(
                                    widget.icon,
                                    color: widget.iconColor,
                                  ),
                                ],
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.detail,
                                    style: TextStyle(
                                      fontSize: 11
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}