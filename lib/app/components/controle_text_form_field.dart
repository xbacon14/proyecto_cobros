import 'package:flutter/material.dart';

class ControleTextFormField extends TextFormField {
  ControleTextFormField({
    ValueChanged<String> onChanged,
    FormFieldValidator<String> validator,
    @required String label,
    bool obscureText,
    double borderRadius,
    double fontSize,
    EdgeInsets padding,
    TextEditingController controller,
    @required Icon icon,
  }) : super(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            suffixIcon: icon,
            contentPadding:
                padding ?? EdgeInsets.only(left: 30, top: 20, bottom: 20),
            labelText: label,
            labelStyle: TextStyle(
              fontSize: fontSize ?? 20,
            ),
          ),
        );
}
