import 'package:flutter/material.dart';

class DatePicker {
  static Future<DateTime> show(BuildContext context, DateTime initialDate,
      DateTime firstDate, DateTime lastDate) async {
    DateTime dtFinal;
    await showDatePicker(
            context: context,
            locale: Locale("es", "PY"),
            firstDate: (firstDate == null ? DateTime.now() : firstDate),
            initialDate: (initialDate == null ? DateTime.now() : initialDate),
            lastDate: (lastDate == null
                ? DateTime.now().add(Duration(days: 365))
                : lastDate))
        .then((value) {
      dtFinal = value;
    });
    return dtFinal;
  }

  static Future<DateTime> showBasic(
      BuildContext context, ThemeData theme) async {
    DateTime dtFinal;
    await showDatePicker(
      context: context,
      locale: Locale("es", "PY"),
      firstDate: DateTime.now(),
      initialDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: theme.copyWith(
            colorScheme: ColorScheme.light(
              primary: theme.primaryColor,
              onPrimary: Colors.white,
              surface: theme.primaryColor,
              onSurface: theme.primaryColor,
              secondary: theme.primaryColor,
            ),
            buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.accent),
          ),
          child: child,
        );
      },
    );
    return dtFinal;
  }
}
