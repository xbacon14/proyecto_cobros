import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobx/mobx.dart';

part 'app_controller.g.dart';

class AppController = _AppControllerBase with _$AppController;

abstract class _AppControllerBase with Store {
  @observable
  int value = 0;

  @observable
  ThemeData themeType;

  @action
  void increment() {
    value++;
  }

  @action
  void changeTheme() {
    // if (isDark) {
    //   themeType = lightTheme();
    // } else {
    //   themeType = darkTheme();
    // }
  }

  ThemeData lightTheme() {
    return ThemeData.light().copyWith(
        primaryColor: getPrimaryColor(),
        textTheme: getTextTheme(),
        buttonColor: getBiuttonColor(),
        splashColor: getPrimaryColor(),
        inputDecorationTheme: getInputDecorationTheme(),
        accentColor: getPrimaryColor(),
        iconTheme: IconThemeData(
          color: getPrimaryColor(), //change your color here
        ));
  }
}

ThemeData darkTheme() {
  return ThemeData.dark().copyWith(
    primaryColor: getPrimaryColor(),
    textTheme: getTextTheme(),
  );
}

Color getPrimaryColor() {
  return Colors.purple;
}

Color getBiuttonColor() {
  return const Color(0xFF4527a0);
}
//#00AFA2
// Color getPrimaryColor() {
//   return const Color(0xFF35d2e5);
// }

TextTheme getTextTheme() {
  return TextTheme(
    headline6:
        GoogleFonts.roboto(color: Colors.white, fontWeight: FontWeight.bold),
    headline5: GoogleFonts.roboto(color: Colors.black87),
    headline4: GoogleFonts.roboto(color: Colors.black87),
    headline3: GoogleFonts.roboto(color: Colors.black87),
    headline2: GoogleFonts.roboto(color: Colors.black87),
    headline1: GoogleFonts.roboto(color: Colors.black87),
    subtitle1: GoogleFonts.roboto(color: Colors.black87),
    subtitle2: GoogleFonts.roboto(color: Colors.black87),
  );
}

InputDecorationTheme getInputDecorationTheme() {
  return InputDecorationTheme(
    labelStyle: GoogleFonts.roboto(color: Colors.black87),
    hintStyle: GoogleFonts.roboto(color: Colors.black87),
  );
}
