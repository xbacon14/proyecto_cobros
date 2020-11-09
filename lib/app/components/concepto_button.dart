import 'package:flutter/material.dart';

import 'utils/themeUtils.dart';

class ConceptoButton extends RawMaterialButton {
  ConceptoButton(
      {@required VoidCallback onPressed,
      @required String label,
      Color primaryColor,
      Color hightlightColor,
      double width,
      double height})
      : super(
            onPressed: onPressed,
            child: Container(
              padding: EdgeInsets.all(10),
              height: height,
              width: width,
              alignment: Alignment.center,
              child: Text(
                label,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            fillColor: primaryColor ?? ThemeUtils.primaryColor,
            highlightColor: hightlightColor ?? ThemeUtils.primaryColor);
}
