import 'package:flutter/material.dart';

class AltSearchbar extends StatefulWidget {
  const AltSearchbar({super.key});

  @override
  State<AltSearchbar> createState() => _AltSearchbarState();
}

class _AltSearchbarState extends State<AltSearchbar> {
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(24),
      color: const Color.fromARGB(255, 226, 226, 226),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        height: 45,
        child: TextField(
          decoration: InputDecoration(
            hintText: "Search message",
            contentPadding: EdgeInsets.only(left: 16, top: 10, bottom: 18),
            hintStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            prefixIcon: Icon(
              Icons.search,
              size: 20,
              color: Colors.black87,
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