import 'package:flutter/material.dart';
import 'package:meals_app/icons/meals_icons_icons.dart';
import 'package:meals_app/models/category_meals.dart';
import 'package:meals_app/screens/meal_detail.dart';
import 'package:meals_app/services/meal_service.dart';

import 'meals_app_theme.dart';
import 'models/meal.dart';

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

class HomeScreen extends StatelessWidget {
  final streams = MealsService.getHomeMeals();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ScreenTitle(),
              StreamsList(streams: streams),
            ],
          ),
        ),
      ),
    );
  }
}

class ScreenTitle extends StatelessWidget {
  const ScreenTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 24.0,
        vertical: 16,
      ),
      child: Text('Recipes', style: Theme.of(context).textTheme.headline4),
    );
  }
}

class StreamsList extends StatelessWidget {
  const StreamsList({
    Key key,
    @required this.streams,
  }) : super(key: key);

  final List<CategoryMeals> streams;

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

class StreamContainer extends StatelessWidget {
  final String categoryName;
  final List<Meal> meals;

  const StreamContainer({Key key, this.categoryName, this.meals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamTitle(title: categoryName),
            MealsList(meals: meals),
          ],
        ),
      ),
    );
  }
}

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

class StreamTitle extends StatelessWidget {
  const StreamTitle({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          Icon(MealsIcons.pasta_icon),
          Text(
            title,
            style: Theme.of(context).textTheme.headline5,
          ),
        ],
      ),
    );
  }
}

class MealTile extends StatelessWidget {
  final Meal meal;

  const MealTile({Key key, this.meal}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          width: 300,
          height: 300,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MealDetailScreen(meal)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FadeInImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(meal.imgUrl),
                    placeholder: AssetImage('images/placeholder.jpeg'),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                          colors: [
                            Colors.black.withOpacity(0.35),
                            Colors.transparent
                          ]),
                    ),
                  ),
                  Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 32.0),
                        child: Text(meal.title,
                            style: Theme.of(context).textTheme.caption),
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
