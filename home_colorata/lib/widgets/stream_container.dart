import 'package:flutter/material.dart';
import 'package:home_colorata/widgets/meals_list.dart';
import 'package:home_colorata/widgets/stream_title.dart';

class StreamContainer extends StatelessWidget {
  const StreamContainer({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Theme.of(context).colorScheme.primary,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            StreamTitle(),
            MealsList(),
          ],
        ),
      ),
    );
  }
}
