import 'package:flutter/material.dart';
import 'package:home_colorata/screens/home_screen.dart';
import 'package:home_colorata/theme/meals_app_theme.dart';

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
