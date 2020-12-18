import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/widgets/stream_title.dart';

import 'meals_list.dart';

class StreamContainer extends StatelessWidget {
  final String categoryName;
  final String categoryImage;
  final List<Meal> meals;

  const StreamContainer(
      {Key key, this.categoryName, this.categoryImage, this.meals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0, bottom: 16),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamTitle(title: categoryName, imgUrl: categoryImage),
            MealsList(meals: meals),
          ],
        ),
      ),
    );
  }
}
