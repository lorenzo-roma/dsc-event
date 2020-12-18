import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  final meal;

  MealDetailScreen(this.meal);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Theme.of(context).colorScheme.background,
        child: SafeArea(
            child: Column(children: [
          Material(
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios),
              onPressed: () => Navigator.pop(context),
            ),
          )
        ])));
  }
}
