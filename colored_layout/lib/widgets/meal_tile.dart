import 'package:flutter/material.dart';

class MealTile extends StatelessWidget {
  const MealTile({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Theme.of(context).colorScheme.primaryVariant,
        width: 300,
        height: 300,
      ),
    );
  }
}
