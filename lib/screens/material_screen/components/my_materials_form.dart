import 'package:d_bam/constants.dart';
import 'package:flutter/material.dart';

class MyMaterialsForm extends StatelessWidget {
  MyMaterialsForm({
    Key? key,
    this.title,
    this.onChanged,
    this.controller,
    this.counting,
    this.counterText,
    this.remove,
    this.add,
  }) : super(key: key);

  final String? title;
  final String? counting;
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? counterText;
  final Function()? remove;
  final Function()? add;

  @override
  Widget build(BuildContext context) {
    // final counter = context.read<CategoryData>();
    return Padding(
      padding: const EdgeInsets.only(left: kPadding),
      child: Row(
        children: [
          Text(
            title ?? '',
            style: kTextStyle16Bold,
          ),
          Spacer(),
          TextButton(
            onPressed: remove,
            child: Icon(
              Icons.remove,
              color: kIcColour,
            ),
          ),
          SizedBox(
            width: 15,
            child: AbsorbPointer(
              child: TextFormField(
                decoration: InputDecoration(border: InputBorder.none),
                controller: controller,
                onChanged: onChanged,
                style: kTextStyle14,
              ),
            ),
          ),
          TextButton(
            onPressed: add,
            child: Icon(
              Icons.add,
              color: kIcColour,
            ),
          ),
          Text('Pcs')
        ],
      ),
    );
  }
}
