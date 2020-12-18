import 'package:flutter/material.dart';

class MealsAppTheme {
  static const Color textMain = Color(0xff000000);
  static const Color textSecondary = Color(0xffd4d4d4);
  static const Color backgroundMain = Color(0xffebeff2);
  static const Color backgroundSecondary = Color(0xfff5f7fA);
  static const Color error = Color(0xfffa0c0c);
  static const Color active = Color(0xfffa4a0c);
  static const Color activeDisabled = Color(0xfffdaa90);
  static const Color activeSecondary = Color(0xff7f8a8e);
  static const Color activeSecondaryDisabled = Color(0xffb5c3c8);

  static ThemeData getTheme() => ThemeData(
      fontFamily: 'Montserrat',
      colorScheme: ColorScheme(
        primary: active,
        primaryVariant: activeDisabled,
        secondary: Colors.black,
        secondaryVariant: Colors.black,
        onError: Colors.black,
        error: Colors.black,
        onBackground: Colors.black,
        onPrimary: Colors.black,
        onSecondary: Colors.black,
        brightness: Brightness.light,
        surface: Colors.white,
        onSurface: Colors.white,
        background: backgroundMain,
      ),
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 18, color: textMain),
        headline4: TextStyle(
            fontSize: 36, color: Colors.black, fontWeight: FontWeight.w700),
        headline5: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
      ));
}
