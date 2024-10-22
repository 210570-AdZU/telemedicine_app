import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyNumberfield extends StatefulWidget {
  final String identifier;
  final String hintText;
  bool obscureText;
  final TextEditingController controller;
  final bool ConfirmPwd;
  final bool isCollapsed;
  final TextEditingController? passwordController;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final EdgeInsets contentPadding;
  final double fontSize;
  final int? maxLines;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final void Function(double) onChanged;

  MyNumberfield({
    required this.identifier,
    required this.hintText,
    required this.obscureText,
    required this.controller,
    this.ConfirmPwd = false,
    this.passwordController,
    this.prefixIcon,
    this.suffixIcon,
    this.isCollapsed=false,
    this.contentPadding=const EdgeInsets.fromLTRB(8, 8, 8, 8),
    this.fontSize=16,
    this.maxLines=1,
    this.keyboardType=TextInputType.none,
    this.textInputAction=TextInputAction.newline,
    required this.onChanged
  });

  @override
  _MyNumberfieldState createState() => _MyNumberfieldState();
}

class _MyNumberfieldState extends State<MyNumberfield> {
  bool _obscureText = false;
  bool _showError = true;
  late FocusNode _clicked;

  @override
  void initState(){
    super.initState();
    _clicked = FocusNode();
    _clicked.addListener(_onFocusChange);
  }

  @override
  void dispose(){
    _clicked.removeListener(_onFocusChange);
    _clicked.dispose();
    super.dispose();
  }

  @override
  void _onFocusChange(){
    setState(() {
      _showError = _clicked.hasFocus && widget.controller.text.isEmpty;
    });
  }


@override
Widget build(BuildContext context) {
  String? validateName(String value) {
    if (!_showError && value.isEmpty) {
      return "Please enter ${widget.identifier.toLowerCase()}";
    } else if (widget.ConfirmPwd && widget.passwordController != null && widget.controller.text != widget.passwordController!.text) {
      return "Passwords do not match";
    } else {
      return null;
    }
  }

  return TextField(
    controller: widget.controller,
    focusNode: _clicked,
    onChanged: (value) => setState(() {_showError = false;}),
    obscureText: widget.obscureText,
    maxLines: widget.maxLines,
    keyboardType: widget.keyboardType,
    textInputAction: widget.textInputAction,
    style: TextStyle(
      fontSize: widget.fontSize,
      fontWeight: FontWeight.w500
    ),
    decoration: InputDecoration(
      errorText: validateName(widget.controller.text),
      contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 8), // Adjust padding to fit height
      hintText: widget.hintText,
      hintStyle: TextStyle(fontSize: widget.fontSize),
      prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, color: Colors.teal) : null,
      suffixIcon: widget.suffixIcon != null
          ? IconButton(
              icon: Icon(widget.obscureText ? Icons.visibility_off : Icons.visibility),
              onPressed: () {
                setState(() {
                  widget.obscureText = !widget.obscureText;
                });
              },
            )
          : null,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: Colors.black12
          ),
      ),
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: Colors.black12
          ),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
            width: 1,
            color: Colors.black12
          ),
      ),
    ),
  );
}
}