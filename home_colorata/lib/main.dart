import 'package:flutter/material.dart';

import 'meals_app_theme.dart';

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
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24.0,
                  vertical: 16,
                ),
                child: Text('Recipes',
                    style: Theme.of(context).textTheme.headline4),
              ),
              StreamList(),
            ],
          ),
        ),
      ),
    );
  }
}

class StreamList extends StatelessWidget {
  const StreamList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      StreamContainer(),
      StreamContainer(),
      StreamContainer(),
      StreamContainer(),
      StreamContainer(),
    ]);
  }
}

class StreamContainer extends StatelessWidget {
  const StreamContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                'Title',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            SingleChildScrollView(
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
            ),
          ],
        ),
      ),
    );
  }
}

class MealTile extends StatelessWidget {
  const MealTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.black,
        width: 300,
        height: 300,
      ),
    );
  }
}
