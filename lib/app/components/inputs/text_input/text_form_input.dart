import 'package:flutter/material.dart';

class TextFormInput extends StatelessWidget {
  final String label;
  final Widget icon;
  final bool isPassword;
  final bool autoFocus;
  final Color color;
  final Color fillColor;
  final bool filled;
  final bool obscureText;
  final TextEditingController controller;
  final Function validator;

  const TextFormInput({
    Key key,
    @required this.label,
    this.icon,
    this.color = Colors.grey,
    this.autoFocus = false,
    this.isPassword = false,
    this.controller,
    this.validator,
    this.fillColor,
    this.filled,
    this.obscureText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: color),
      obscureText: isPassword,
      autofocus: autoFocus,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 1.0),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 1.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 1.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: color, width: 1.0),
        ),
        labelText: label,
        labelStyle: TextStyle(color: color),
        suffixIcon: icon,
        suffixStyle: TextStyle(color: color),
        filled: filled,
        fillColor: fillColor,
      ),
    );
  }
}
