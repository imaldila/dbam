import 'package:flutter/material.dart';

import '../constants.dart';

class BottonRounded extends StatelessWidget {
  BottonRounded({Key? key, required this.title, required this.onPressed})
      : super(key: key);
  final String title;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: kPadding,
      borderRadius: BorderRadius.circular(kPadding),
      shadowColor: kBtnColour.withOpacity(0.5),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(kPadding),
        child: ElevatedButton(
          onPressed: onPressed,
          child: Text(
            title,
            style: kBtnTextStyle22,
          ),
        ),
      ),
    );
  }
}
