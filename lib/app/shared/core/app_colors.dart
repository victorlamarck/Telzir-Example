import 'package:flutter/material.dart';

class AppColors {
  static const int _blackPrimaryValue = 0xFF000000;
  static const MaterialColor primaryBlack = MaterialColor(
    _blackPrimaryValue,
    <int, Color>{
      50: Color(0xFF000000),
      100: Color(0xFF000000),
      200: Color(0xFF000000),
      300: Color(0xFF000000),
      400: Color(0xFF000000),
      500: Color(_blackPrimaryValue),
      600: Color(0xFF000000),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000),
    },
  );

  static Color green = Color.fromARGB(255, 0, 153, 51);
  static Color grey = const Color(0xFF57575A);
  static Color white = const Color(0xFFFFFFFF);
  static Color red = const Color(0xFFFF0000);
  static Color secondary = const Color(0xFFFFC400);
}
