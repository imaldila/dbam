import 'package:d_bam/constants.dart';
import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDropcoreForm extends StatelessWidget {
  const MyDropcoreForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Row(
        children: [
          Text(
            'Dropcore',
            style: kTextStyle16Bold,
          ),
          Spacer(),
          Container(
            width: 50,
            child: TextField(
              onChanged: context.read<TextData>().getDropcore,
              controller: dropcoreController,
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
            'Meter',
            style: kTextStyle14,
          )
        ],
      ),
    );
  }
}
