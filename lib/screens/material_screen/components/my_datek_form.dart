import 'package:d_bam/constants.dart';
import 'package:d_bam/models/text_data.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyDatekForm extends StatelessWidget {
  MyDatekForm({Key? key}) : super(key: key);

  final stoController = TextEditingController();
  final odcController = TextEditingController();
  final odpController = TextEditingController();
  final portController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final myDatekProvider = context.read<TextData>();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'STO :',
            style: kTextStyle16Bold,
          ),
          SizedBox(
            width: 50,
            child: TextField(
              style: kTextStyle14,
              controller: stoController,
              onChanged: myDatekProvider.getSTO,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
              maxLength: 3,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
                  border: UnderlineInputBorder(),
                  counterText: ''),
            ),
          ),
          const SizedBox(width: kPadding),
          Text(
            'ODC :',
            style: kTextStyle16Bold,
          ),
          SizedBox(
            width: 50,
            child: TextField(
              style: kTextStyle14,
              controller: odcController,
              onChanged: myDatekProvider.getODC,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
              maxLength: 3,
              textCapitalization: TextCapitalization.characters,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
                  border: UnderlineInputBorder(),
                  counterText: ''),
            ),
          ),
          const SizedBox(width: kPadding),
          Text(
            'ODP :',
            style: kTextStyle16Bold,
          ),
          SizedBox(
            width: 50,
            child: TextField(
              style: kTextStyle14,
              controller: odpController,
              onChanged: myDatekProvider.getODP,
              textInputAction: TextInputAction.next,
              textAlign: TextAlign.center,
              maxLength: 3,
              textCapitalization: TextCapitalization.characters,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
                  border: UnderlineInputBorder(),
                  counterText: ''),
            ),
          ),
          const SizedBox(width: kPadding),
          Text(
            'PORT :',
            style: kTextStyle16Bold,
          ),
          SizedBox(
            width: 50,
            child: TextField(
              style: kTextStyle14,
              controller: portController,
              onChanged: myDatekProvider.getPort,
              textInputAction: TextInputAction.done,
              textAlign: TextAlign.center,
              maxLength: 3,
              textCapitalization: TextCapitalization.characters,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
                  border: UnderlineInputBorder(),
                  counterText: ''),
            ),
          )
        ],
      ),
    );
  }
}
