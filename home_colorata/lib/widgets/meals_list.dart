import 'package:flutter/material.dart';
import 'package:home_colorata/widgets/meal_tile.dart';

class MealsList extends StatelessWidget {
  const MealsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          MealTile(),
          MealTile(),
          MealTile(),
          MealTile(),
          MealTile(),
        ],
      ),
    );
  }
}
