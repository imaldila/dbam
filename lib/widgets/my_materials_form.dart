import 'package:d_bam/constants.dart';
import 'package:flutter/material.dart';

class MyMaterialsForm extends StatelessWidget {
  MyMaterialsForm({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kPadding),
      child: Row(
        children: [
          Text(
            title!,
            style: kTextStyle16Bold,
          ),
          Spacer(),
          TextButton(
            onPressed: () {},
            child: Icon(
              Icons.remove,
              color: kIcColour,
            ),
          ),
          Text(
            'Test',
            style: kTextStyle14,
          ),
          TextButton(
            onPressed: () {},
            child: Icon(
              Icons.add,
              color: kIcColour,
            ),
          ),
        ],
      ),
    );
  }
}
