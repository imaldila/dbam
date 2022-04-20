import 'package:d_bam/constants.dart';
import 'package:d_bam/models/choose_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyChoices extends StatelessWidget {
  const MyChoices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseData>(
      builder: (context, choose, child) {
        return Padding(
          padding: const EdgeInsets.only(top: kPadding / 2, bottom: kPadding),
          child: Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: kPadding,
            spacing: kPadding,
            children: List<Widget>.generate(
              choose.chooseCount,
              (int index) {
                return ChoiceChip(
                  autofocus: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16)),
                  padding: EdgeInsets.all(kPadding / 2),
                  backgroundColor: kBgColour,
                  labelPadding: EdgeInsets.all(kPadding / 2),
                  selectedColor: kBtnColour,
                  elevation: 8,
                  label: Text(choose.chooseDatas[index].label),
                  labelStyle: kTextStyle14Bold,
                  selected: choose.chooseDatas[index].isSelected =
                      index == choose.takeChip,
                  avatar: choose.chooseDatas[index].isSelected
                      ? Icon(Icons.check)
                      : null,
                  onSelected: (bool selected) {
                    choose.takeChip = selected ? index : null;
                  },
                );
              },
            ).toList(),
          ),
        );
      },
    );
  }
}
