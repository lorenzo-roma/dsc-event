import 'package:flutter/material.dart';

class StreamTitle extends StatelessWidget {
  const StreamTitle({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Text(
        'Title',
        style: Theme.of(context).textTheme.headline5,
      ),
    );
  }
}
