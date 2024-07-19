import 'package:flutter/material.dart';

class RegisterDropdownselect extends StatefulWidget {
  final List<String> selectList;

  RegisterDropdownselect({
    Key? key,
    required this.selectList
  }) : super(key: key);

  @override
  State<RegisterDropdownselect> createState() => _RegisterDropdownselectState();
}

class _RegisterDropdownselectState extends State<RegisterDropdownselect> {
  String dropdownValue = '';

  @override
  void initState() {
    super.initState();
    dropdownValue = widget.selectList.first;
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      isExpanded: true,
      value: dropdownValue,
      decoration: InputDecoration(
        isDense: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0), // for rounded corners
          borderSide: BorderSide(color: Colors.blue, width: 2.0), // border
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8.0), // padding
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
            padding: const EdgeInsets.only(left:8),
            child: Text(
              value,
              style: TextStyle(
                fontSize: 14
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
