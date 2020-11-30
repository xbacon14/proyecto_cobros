import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:proyecto_cobros/app/utils/themeUtils.dart';

class ControleButton extends RawMaterialButton {
  ControleButton({
    @required VoidCallback onPressed,
    @required String label,
    Color primaryColor,
    Color highlightColor,
  }) : super(
          onPressed: onPressed,
          child: Container(
            padding: EdgeInsets.all(10),
            height: 60,
            alignment: Alignment.center,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.russoOne().copyWith(
                  fontSize: 23,
                  color: Colors.white,
                  fontWeight: FontWeight.w500),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fillColor: primaryColor ?? ThemeUtils.primaryColor,
          highlightColor: highlightColor ?? ThemeUtils.primaryColor,
        );
}
