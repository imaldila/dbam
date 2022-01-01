import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/datepicker.dart';
import 'package:d_bam/models/package_data.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/widgets/my_adrdess_form.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:d_bam/widgets/my_nte_form.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class FormMaterial extends StatefulWidget {
  FormMaterial({Key? key}) : super(key: key);

  @override
  State<FormMaterial> createState() => _FormMaterialState();
}

class _FormMaterialState extends State<FormMaterial> {
  bool visibilitySTB = false;
  bool visibilityONT = false;

  // void _changed(bool visibility, String field) {
  //   setState(() {
  //     if (field == 'STB') {
  //       visibilitySTB = visibility;
  //     }
  //     if (field == 'ONT') {
  //       visibilityONT = visibility;
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // make Form for other Clips
    return Consumer<CategoryData>(
      builder: (context, categoryData, child) => Scaffold(
        backgroundColor: kBgColour,
        appBar: buildAppBar(context),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(kPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Please Select an option below',
                  style: kTextStyle16Bold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: kPadding,
                ),
                Wrap(
                  spacing: 8,
                  children: [
                    for (int i = 0; i < categoryData.categoryCount; i++)
                      FilterChip(
                          backgroundColor: kBgColour,
                          elevation: 8,
                          selectedColor: kBtnColour,
                          labelStyle: kTextStyle14,
                          selected: categoryData.categories[i].isSelected,
                          label: Text(categoryData.categories[i].label),
                          onSelected: (selected) {
                            setState(() {
                              categoryData.categories[i].isSelected = selected;
                            });
                          }),
                  ],
                ),
                SizedBox(
                  height: kPadding,
                ),
                Divider(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    for (int i = 0; i < categoryData.categoryCount; i++)
                      if (categoryData.categories[i].isSelected &&
                          categoryData.categories[i].label == 'ONT')
                        MyNTEForm(
                          oldTitle: 'Old ONT',
                          newTitle: 'New ONT',
                        )
                      else if (categoryData.categories[i].isSelected &&
                          categoryData.categories[i].label == 'STB')
                        MyAddressForm()
                      else if (categoryData.categories[i].isSelected)
                        Text('Added')
                      else
                        Container(),
                    SizedBox(
                      height: kPadding,
                    ),
                  ],
                ),
                BottonRounded(
                  title: 'Next',
                  onPressed: () {
                    print(context.read<PackageData>().selected);
                    print(context.read<DatePicker>().selected);
                    print(context.read<TextData>().order);
                    print(context.read<TextData>().service);
                    print(context.read<TextData>().name);
                    print(context.read<TextData>().phone);
                    print(context.read<TextData>().address);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 64,
      backgroundColor: kBgColour,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/ic_left.svg',
            color: kIcColour,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        'Material Form',
        style: kTextStyle20Bold,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorPadding),
          child: CircleAvatar(
            foregroundColor: Colors.red,
            backgroundColor: kBgColour,
            child: Image.asset(
              'assets/images/logo1.png',
              fit: BoxFit.contain,
            ),
            radius: 24,
          ),
        ),
      ],
      shadowColor: kBgColour,
    );
  }
}

    // visibilityONT
                    //     ? Row(
                    //         children: [
                    //           Expanded(
                    //             flex: 11,
                    //             child: MyTextForm(),
                    //           ),
                    //           Expanded(
                    //             child: IconButton(
                    //               onPressed: () {
                    //                 _changed(false, 'ONT');
                    //               },
                    //               icon: Icon(Icons.cancel),
                    //             ),
                    //           )
                    //         ],
                    //       )
                    //     : Container(),