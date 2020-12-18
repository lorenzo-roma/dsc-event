import 'package:flutter/material.dart';

class MealsAppTheme {
  static const Color textMain = Color(0xff000000);
  static const Color textSecondary = Color(0xffD4D4D4);
  static const Color backgroundMain = Color(0xffebeff2);
  static const Color backgroundSecondary = Color(0xffF5F7FA);
  static const Color error = Color(0xffFA0C0C);
  static const Color active = Color(0xffA4A0C);
  static const Color activeDisabled = Color(0xffFDAA90);
  static const Color activeSecondary = Color(0xff7F8A8E);
  static const Color activeSecondaryDisabled = Color(0xffB5C3C8);

  static ThemeData getTheme() => ThemeData(
      colorScheme: ColorScheme(
        primary: Colors.black,
        primaryVariant: Colors.black,
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
        bodyText1: TextStyle(fontSize: 18, fontFamily: 'Montserrat'),
        headline4: TextStyle(
            fontSize: 36,
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.w700),
        headline5: TextStyle(
            fontSize: 24,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600),
        caption: TextStyle(
            fontSize: 24,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
            color: Colors.white),
      ));
}
