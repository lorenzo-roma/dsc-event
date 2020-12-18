import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

import 'meal_tile.dart';

class MealsList extends StatelessWidget {
  const MealsList({
    Key key,
    @required this.meals,
  }) : super(key: key);

  final List<Meal> meals;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: meals.map((meal) => MealTile(meal: meal)).toList(),
      ),
    );
  }
}
