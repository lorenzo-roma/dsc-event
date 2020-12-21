import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';

class MealDetailScreen extends StatelessWidget {
  final Meal meal;

  MealDetailScreen(this.meal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: NestedScrollView(
          headerSliverBuilder: (context, innerBoxIsScrolled) =>
              [AppBar(meal: meal)],
          body: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IngredientsTitle(),
                Ingredients(meal: meal),
                AddToCartButton(),
                Text(
                  "Instructions",
                  style: Theme.of(context).textTheme.headline5,
                ),
                Text(
                  meal.instructions,
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
          )),
    );
  }
}

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        color: Theme.of(context).colorScheme.primary,
        textColor: Colors.white,
        onPressed: () => null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.shopping_cart_outlined),
            Text("Add to shopping list")
          ],
        ),
      ),
    );
  }
}

class Ingredients extends StatelessWidget {
  const Ingredients({
    Key key,
    @required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    final ingredients = meal.ingredients
        .map((ingredient) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "• ${ingredient.name} (${ingredient.measure})",
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ))
        .toList();
    return Row(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ingredients.sublist(0, meal.ingredients.length ~/ 2),
          ),
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: ingredients.sublist(meal.ingredients.length ~/ 2),
          ),
        ),
      ],
    );
  }
}

class IngredientsTitle extends StatelessWidget {
  const IngredientsTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Ingredients',
            style: Theme.of(context).textTheme.headline5,
          ),
          Row(
            children: [
              Icon(Icons.person_add),
              Chip(
                label: Text(
                  "4",
                  style: Theme.of(context)
                      .textTheme
                      .button
                      .copyWith(color: Colors.white),
                ),
                backgroundColor: Theme.of(context).colorScheme.primary,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key key,
    @required this.meal,
  }) : super(key: key);

  final Meal meal;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        pinned: true,
        stretch: false,
        expandedHeight: 300.0,
        flexibleSpace: FlexibleSpaceBar(
          stretchModes: [StretchMode.fadeTitle],
          title: Text(
            meal.title,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          collapseMode: CollapseMode.pin,
          background: Container(
            color: Theme.of(context).colorScheme.background,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(35)),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  FadeInImage(
                      fit: BoxFit.cover,
                      placeholder: AssetImage('images/placeholder.png'),
                      image: NetworkImage(meal.imgUrl)),
                  const DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment(0.0, 0.5),
                        end: Alignment(0.0, 0.0),
                        colors: <Color>[
                          Color(0x60000000),
                          Color(0x00000000),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
