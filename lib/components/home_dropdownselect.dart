import 'package:flutter/material.dart';

class HomeDropdownselect extends StatefulWidget {
  final List<String> selectList;

  HomeDropdownselect({
    Key? key,
    required this.selectList
  }) : super(key: key);

  @override
  State<HomeDropdownselect> createState() => _HomeDropdownselectState();
}

class _HomeDropdownselectState extends State<HomeDropdownselect> {
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.selectList.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
        isDense: true,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderSide: BorderSide.none
        ),
        contentPadding: EdgeInsets.zero,  // Remove internal padding
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: widget.selectList.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              value,
              style: TextStyle(fontSize: 12),
            ),
          ),
        );
      }).toList(),
    );
  }
}
