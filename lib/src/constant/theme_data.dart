import 'package:flutter/material.dart';

ThemeData themeDataApp() {
  return ThemeData(
      fontFamily: 'Montserrat',
      primaryColor: const Color(0xFF22feed),
      primaryColorDark: const Color(0xFF010b87),
      accentColor: const Color(0xFFfe22a1),
      errorColor: const Color(0xFFfe7f22),
      disabledColor: const Color(0xffA0A0A0),
      primarySwatch: const MaterialColor(
        0xFFfe22a1,
        const <int, Color>{
          50: const Color(0xFFfe84cb),
          100: const Color(0xFFfe70c2),
          200: const Color(0xFFfe5dba),
          300: const Color(0xFFfe49b2),
          400: const Color(0xFFfe36a9),
          500: const Color(0xFFfe22a1),
          600: const Color(0xFFfe0e99),
          700: const Color(0xFFf8018f),
          800: const Color(0xFFe40184),
          900: const Color(0xFFd10179),
        },
      ));
}
