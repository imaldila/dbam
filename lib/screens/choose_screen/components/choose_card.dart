import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class ChooseCard extends StatelessWidget {
  const ChooseCard({
    Key? key,
    required this.svgPicture,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final SvgPicture svgPicture;
  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Material(
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
          ),
        ),
        const SizedBox(
          height: kPadding,
        ),
        Text(
          label,
          style: kTextStyle20Bold,
        )
      ],
    );
  }
}
