import 'package:flutter/material.dart';

class MySearchbar extends StatefulWidget {
  const MySearchbar({super.key});

  @override
  State<MySearchbar> createState() => _MySearchbarState();
}

class _MySearchbarState extends State<MySearchbar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(24),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.45,
        height: 37,
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search...",
            contentPadding: EdgeInsets.only(left: 16, top: 10, bottom: 18),
            hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            suffixIcon: Padding(
              padding: EdgeInsets.only(left: 12,),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueGrey,
                    ),
                    child: Center(
                      child: Icon(
                        Icons.search,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(24),
              borderSide: BorderSide.none
            )
          ),
        ),
      ),
    );
  }
}