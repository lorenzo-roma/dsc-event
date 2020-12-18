import 'package:flutter/material.dart';
import 'package:home_colorata/widgets/stream_container.dart';

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
