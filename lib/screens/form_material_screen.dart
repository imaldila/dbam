import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/datepicker.dart';
import 'package:d_bam/models/package_data.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:d_bam/widgets/my_text_form.dart';
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

  void _changed(bool visibility, String field) {
    setState(() {
      if (field == 'STB') {
        visibilitySTB = visibility;
      }
      if (field == 'ONT') {
        visibilityONT = visibility;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Consumer<CategoryData>(
      builder: (context, categoryData, child) => Scaffold(
        backgroundColor: kBgColour,
        appBar: buildAppBar(context),
        //This is not finish !!!
        body: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 24,
            horizontal: kHorPadding,
          ),
          children: [
            Wrap(
              // direction: Axis.vertical,
              spacing: 10,
              runSpacing: 20,
              children: [
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    setState(() {
                      visibilitySTB
                          ? _changed(false, categoryData.categories[1].label)
                          : _changed(true, categoryData.categories[1].label);
                      print('tapped');
                    });
                  },
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(16),
                    shadowColor: Colors.white,
                    child: Container(
                      decoration: visibilitySTB
                          ? kStyleBoxDecorationTapped
                          : kStyleBoxDecoration,
                      padding: EdgeInsets.all(kPadding),
                      child: Text(
                        categoryData.categories[1].label,
                        style: kTextStyle16Bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  borderRadius: BorderRadius.circular(16),
                  onTap: () {
                    setState(() {
                      visibilityONT
                          ? _changed(false, categoryData.categories[0].label)
                          : _changed(true, categoryData.categories[0].label);
                      print('tapped');
                    });
                  },
                  child: Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(16),
                    shadowColor: Colors.white,
                    child: Container(
                      decoration: visibilityONT
                          ? kStyleBoxDecorationTapped
                          : kStyleBoxDecoration,
                      padding: EdgeInsets.all(kPadding),
                      child: Text(
                        categoryData.categories[0].label,
                        style: kTextStyle16Bold,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            visibilitySTB
                ? Row(
                    children: [
                      Expanded(
                        flex: 11,
                        child: MyTextForm(),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            _changed(false, 'STB');
                          },
                          icon: Icon(Icons.cancel),
                        ),
                      )
                    ],
                  )
                : Container(),
            visibilityONT
                ? Row(
                    children: [
                      Expanded(
                        flex: 11,
                        child: MyTextForm(),
                      ),
                      Expanded(
                        child: IconButton(
                          onPressed: () {
                            _changed(false, 'ONT');
                          },
                          icon: Icon(Icons.cancel),
                        ),
                      )
                    ],
                  )
                : Container(),
            SizedBox(
              height: kPadding,
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
