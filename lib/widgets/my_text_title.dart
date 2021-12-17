import 'package:flutter/material.dart';

import '../constants.dart';

class MyTextTitle extends StatelessWidget {
  MyTextTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kPadding),
      child: Text(
        title,
        style: kTextStyle16,
      ),
    );
  }
}