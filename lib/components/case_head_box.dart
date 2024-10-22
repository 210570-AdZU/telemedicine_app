import 'package:flutter/material.dart';

class CaseHeadBox extends StatefulWidget {
  final VoidCallback onTap;
  final String? name;
  final String? id;
  final String? test;
  final String? hospital;

  const CaseHeadBox({
    Key? key,
    required this.onTap,
    this.name,
    this.id,
    this.test,
    this.hospital,
    }
  ) : super(key: key);

  @override
  State<CaseHeadBox> createState() => _CaseHeadBoxState();
}

class _CaseHeadBoxState extends State<CaseHeadBox> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        InkWell(
          onTap: widget.onTap,
          child: Material(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
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
                                  CircleAvatar(
                                    backgroundColor: Colors.green,
                                    radius: 11,
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 9,
                                      child: Icon(
                                        Icons.person,
                                        color: Colors.green,
                                        size: 18,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 7),
                                  Text(
                                    '${widget.name}',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.medication, color: Colors.green),
                                  SizedBox(width: 5),
                                  Text(
                                    '${widget.id}',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.texture_sharp, color: Colors.black45),
                                  SizedBox(width: 5),
                                  Text(
                                    '${widget.test}',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 16),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Icon(Icons.chat, color: Colors.black38),
                                  SizedBox(width: 5),
                                  Text(
                                    '${widget.hospital}',
                                    style: TextStyle(
                                      color: Colors.black45,
                                      fontWeight: FontWeight.bold
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
              ),
            ),
          ),
        ),
      ],
    );
  }
}
