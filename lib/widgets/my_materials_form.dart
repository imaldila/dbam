import 'package:d_bam/constants.dart';
import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/counter.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyMaterialsForm extends StatelessWidget {
  MyMaterialsForm({Key? key, this.title, this.onChanged, this.controller})
      : super(key: key);

  final String? title;
  final TextEditingController? controller;
  final Function(String?)? onChanged;

  @override
  Widget build(BuildContext context) {
    final counter = context.read<Counter>();
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
            onPressed: () => (counter.count > 0
                ? context.read<Counter>().decrement()
                : null),
            child: Icon(
              Icons.remove,
              color: kIcColour,
            ),
          ),
          Text(
            '${context.read<Counter>().count}',
            style: kTextStyle14,
          ),
          TextButton(
            onPressed: () => counter.increment(),
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
