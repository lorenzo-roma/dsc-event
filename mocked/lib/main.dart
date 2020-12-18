import 'package:flutter/material.dart';
import 'package:meals_app/screens/home_screen.dart';
import 'package:meals_app/theme/meals_app_theme.dart';

void main() => runApp(MealsApp());

class MealsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MealsAppTheme.getTheme(),
      home: HomeScreen(),
    );
  }
}
