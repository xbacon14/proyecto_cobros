import 'package:flutter/material.dart';

class SizeUtils {
  static MediaQueryData _mediaQuery;
  static double widthScreen;
  static double heightScreen;
  static double statusBarheight;

  static init(BuildContext context){
    _mediaQuery = MediaQuery.of(context);
    widthScreen = _mediaQuery.size.width;
    heightScreen = _mediaQuery.size.height;
    statusBarheight = _mediaQuery.padding.top;
  }

}