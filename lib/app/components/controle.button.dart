import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ControleButton extends RawMaterialButton {
  ControleButton({
    @required VoidCallback onPressed,
    @required String label,
    Color primaryColor,
    Color highlightColor,
  }) : super(
          onPressed: onPressed,
          child: Container(
            height: 45,
            alignment: Alignment.center,
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat().copyWith(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          fillColor: primaryColor ?? Color(0xFF052744),
          highlightColor: highlightColor ?? Color(0xFF052744),
        );
}
