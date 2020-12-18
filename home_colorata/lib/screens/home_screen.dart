import 'package:flutter/material.dart';
import 'package:home_colorata/widgets/home_title.dart';
import 'package:home_colorata/widgets/stream_list.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.background,
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HomeTitle(),
              StreamList(),
            ],
          ),
        ),
      ),
    );
  }
}
