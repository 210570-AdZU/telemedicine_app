import 'package:flutter/material.dart';

class CaseEndBox extends StatefulWidget {
  final VoidCallback onTap;
  final String title;
  final String text;

  const CaseEndBox({
    Key? key,
    required this.onTap,
    this.title='',
    this.text=''
  }) : super(key: key);

  @override
  State<CaseEndBox> createState() => _CaseEndBoxState();
}

class _CaseEndBoxState extends State<CaseEndBox> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Duplicate Container
          Container(
            width: 150,
            decoration: BoxDecoration(
              color: Colors.black45,
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(24),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(4, 4, 2, 0),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.title,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 11,
                                fontWeight: FontWeight.bold,
                              ),
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
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(8),
                bottomRight: Radius.circular(8),
                bottomLeft: Radius.circular(8),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.text,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 12
                              ),
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
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: Text("Test")),
      body: Center(
        child: CaseEndBox(
          onTap: () {
            print("Box tapped");
          },
        ),
      ),
    ),
  ));
}
