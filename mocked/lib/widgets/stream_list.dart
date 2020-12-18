import 'package:flutter/material.dart';
import 'package:meals_app/models/category_meals.dart';
import 'package:meals_app/services/meal_service.dart';
import 'package:meals_app/widgets/stream_container.dart';

class StreamsList extends StatelessWidget {
  StreamsList({
    Key key,
  }) : super(key: key);

  final List<CategoryMeals> streams = MealsService.getHomeMeals();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: streams
          .map((categoryMeals) => StreamContainer(
              categoryName: categoryMeals.categoryTitle,
              meals: categoryMeals.meals))
          .toList(),
    );
  }
}
