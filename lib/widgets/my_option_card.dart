import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class OptionCard extends StatelessWidget {
  const OptionCard({
    Key? key,
    required this.svgPicture,
  }) : super(key: key);

  final SvgPicture svgPicture;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 8,
      borderRadius: BorderRadius.circular(16),
      shadowColor: kBtnColour,
      child: Container(
        height: 256,
        width: 256,
        child: Padding(
          padding: const EdgeInsets.all(38.0),
          child: svgPicture,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: Colors.white),
      ),
    );
  }
}