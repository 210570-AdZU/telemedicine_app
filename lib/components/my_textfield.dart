import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextfield extends StatefulWidget {
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

  MyTextfield({
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
    this.textInputAction=TextInputAction.newline
  });

  @override
  _MyTextfieldState createState() => _MyTextfieldState();
}

class _MyTextfieldState extends State<MyTextfield> {
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
      onChanged: (value) => setState(() {_showError=false;}),
      obscureText: _obscureText,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        errorText: validateName(widget.controller.text),
        isCollapsed: widget.isCollapsed,
        contentPadding: widget.contentPadding,
        hintText: widget.hintText,
        hintStyle: TextStyle(fontSize: widget.fontSize),
        prefixIcon: widget.prefixIcon != null ? Icon(widget.prefixIcon, color: Colors.teal,) : null,
        suffixIcon: widget.suffixIcon != null
            ? IconButton(
                icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off,),
                onPressed: () {
                  setState(() {
                    _obscureText = !_obscureText;
                  });
                },
              )
            : null,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
        )
      ),
    );
  }
}