import 'package:flutter/material.dart';
import 'package:meals_app/services/meal_service.dart';
import 'package:meals_app/widgets/stream_container.dart';

class StreamsList extends StatelessWidget {
  const StreamsList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: MealsService.getHomeMeals(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: List<StreamContainer>.from(snapshot.data
                  .map((categoryMeals) => StreamContainer(
                      categoryImage: categoryMeals.categoryImage,
                      categoryName: categoryMeals.categoryTitle,
                      meals: categoryMeals.meals))
                  .toList()),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.only(top: 32.0),
              child: Center(
                  child: CircularProgressIndicator(
                valueColor: new AlwaysStoppedAnimation<Color>(
                    Theme.of(context).colorScheme.primary),
              )),
            );
          }
        });
  }
}
