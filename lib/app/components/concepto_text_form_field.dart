import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ConceptoTextFormField extends TextFormField {
  ConceptoTextFormField({
    ValueChanged<String> onChanged,
    FormFieldValidator<String> validator,
    @required String label,
    bool obscureText,
    double boderRadius,
    double fontSize,
    EdgeInsets padding,
    GoogleFonts googleFonts,
    TextEditingController controller,
  }) : super(
          controller: controller,
          onChanged: onChanged,
          validator: validator,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            contentPadding:
                padding ?? EdgeInsets.only(left: 30, top: 20, bottom: 20),
            labelText: label,
            labelStyle: TextStyle(
              fontSize: fontSize ?? 20,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(boderRadius ?? 30),
            ),
          ),
        );
}
