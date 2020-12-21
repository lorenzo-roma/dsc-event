import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meals_app/models/meal.dart';
import 'package:meals_app/services/meal_service.dart';

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
          body: FutureBuilder(
            future: MealsService.getMealDetail(meal.id),
            builder: (context, snapshot) {
              print(snapshot.error);
              if (snapshot.hasData) {
                final meal = snapshot.data;
                return Padding(
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
                      SizedBox(height: 20),
                      Text(
                        meal.instructions,
                        style: Theme.of(context).textTheme.bodyText2,
                      )
                    ],
                  ),
                );
              } else
                return Center(
                  child: CircularProgressIndicator(),
                );
            },
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
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        color: Theme.of(context).colorScheme.primary,
        textColor: Colors.white,
        onPressed: () => null,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.shopping_cart_outlined),
              SizedBox(width: 16),
              Text(
                "Add to shopping list",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    .copyWith(color: Colors.white),
              )
            ],
          ),
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
      crossAxisAlignment: CrossAxisAlignment.start,
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
              NumberChip(),
            ],
          )
        ],
      ),
    );
  }
}

class NumberChip extends StatelessWidget {
  const NumberChip({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: Row(
        children: [
          Container(
              height: 25,
              width: 30,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10)),
              ),
              child: Center(
                  child: Text('4',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(color: Colors.white)))),
          SizedBox(width: 1),
          Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(10),
                    bottomRight: Radius.circular(10)),
              ),
              child: Center(
                  child: Icon(Icons.arrow_drop_down,
                      size: 20, color: Colors.white)))
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
