import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:overlay_support/overlay_support.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
        child: GetMaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Cobros',
      theme: ThemeData(
        appBarTheme: AppBarTheme(
            elevation: 5,
            color: Color.fromRGBO(57, 151, 114, 1),
            iconTheme: IconThemeData(color: Colors.white)),
        textTheme: TextTheme(
          bodyText1: GoogleFonts.montserrat(),
          bodyText2: GoogleFonts.montserrat(),
        ),
        primaryColor: Color.fromRGBO(57, 151, 114, 1),
        accentColor: Color.fromRGBO(57, 151, 114, 1),
        backgroundColor: Color.fromRGBO(57, 151, 114, 1),
      ),
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('es', 'PY'), // English, no country code
      ],
      initialRoute: '/',
      onGenerateRoute: Modular.generateRoute,
    ));
  }
}
