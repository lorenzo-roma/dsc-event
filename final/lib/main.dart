import 'package:flutter/material.dart';
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
  final homeData = MealsService.getHomeMeals();
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 24.0,
                vertical: 16,
              ),
              child:
                  Text('Recipes', style: Theme.of(context).textTheme.headline4),
            ),
            Expanded(
              child: FutureBuilder(
                  future: MealsService.getHomeMeals(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView(
                        children: List<StreamContainer>.from(snapshot.data
                            .map((categoryMeals) => StreamContainer(
                                categoryName: categoryMeals.categoryTitle,
                                meals: categoryMeals.meals))
                            .toList()),
                      );
                    } else {
                      return Center(child: CircularProgressIndicator());
                    }
                  }),
            ),
          ],
        ),
      ),
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                categoryName,
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: meals.map((meal) => MealTile(meal: meal)).toList(),
              ),
            ),
          ],
        ),
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
          width: 200,
          height: 200,
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MealDetailScreen(meal)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              child: Stack(
                children: [
                  FadeInImage(
                    image: NetworkImage(meal.imgUrl),
                    placeholder: AssetImage('images/placeholder.jpeg'),
                  ),
                  Container(
                    color: Colors.black12,
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
