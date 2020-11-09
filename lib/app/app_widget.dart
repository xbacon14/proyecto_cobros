import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
        child: GetMaterialApp(
      navigatorKey: Modular.navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'App Cobros',
      theme: ThemeData(
        accentColor: Color(0xFFD2691E),
        appBarTheme: AppBarTheme(
          elevation: 5,
          color: Color(0xFFD2691E),
        ),

        //altera a cor do datePicker
        colorScheme: ColorScheme.light(
          primary: Color(0xFFD2691E),
          onPrimary: Colors.white,
          surface: Color(0xFFD2691E),
          onSurface: Color(0xFFD2691E),
          secondary: Color(0xFFD2691E),
        ),
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
