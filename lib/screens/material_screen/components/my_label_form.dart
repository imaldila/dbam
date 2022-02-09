import 'package:d_bam/constants.dart';
import 'package:flutter/material.dart';

class MyLabelForm extends StatelessWidget {
  MyLabelForm(
      {Key? key, this.onChanged, this.controller, this.label, this.units})
      : super(key: key);
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final String? label, units;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Row(
        children: [
          Text(
            label!,
            style: kTextStyle16Bold,
          ),
          Spacer(),
          SizedBox(
            width: 50,
            child: TextField(
              onChanged: onChanged,
              // onChanged: context.watch<TextData>().getDropcore,
              controller: controller,
              style: kTextStyle14,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              maxLength: 3,
              decoration: InputDecoration(
                enabledBorder: UnderlineInputBorder(),
                border: UnderlineInputBorder(borderSide: BorderSide()),
                counterText: '',
              ),
            ),
          ),
          SizedBox(
            width: kPadding,
          ),
          Text(
            units ?? '',
            style: kTextStyle14,
          )
        ],
      ),
    );
  }
}
