import 'package:flutter/material.dart';

class StreamTitle extends StatelessWidget {
  const StreamTitle({
    Key key,
    @required this.title,
    @required this.imgUrl,
  }) : super(key: key);

  final String title;
  final String imgUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        children: [
          SizedBox(height: 60, width: 60, child: Image.network(imgUrl)),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ],
      ),
    );
  }
}
