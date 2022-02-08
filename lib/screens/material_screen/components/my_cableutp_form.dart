import 'package:d_bam/constants.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCableUTP extends StatelessWidget {
  MyCableUTP({Key? key, this.onChanged, this.controller}) : super(key: key);
  final TextEditingController? controller;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kPadding),
      child: Row(
        children: [
          Text(
            'Cable UTP',
            style: kTextStyle16Bold,
          ),
          Spacer(),
          SizedBox(
            width: 50,
            child: TextField(
              onChanged: context.watch<TextData>().getCableUTP,
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
            'Meter',
            style: kTextStyle14,
          )
        ],
      ),
    );
  }
}
