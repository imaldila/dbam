import 'package:d_bam/models/datepicker.dart';
import 'package:d_bam/models/package_data.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:d_bam/widgets/my_categories_filter.dart';
import 'package:d_bam/widgets/my_categories_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class FormMaterial extends StatelessWidget {
  FormMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    // make Form for other Clips
    return Scaffold(
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
              MyCategoriesFilter(),
              SizedBox(
                height: kPadding,
              ),
              Divider(),
              MyCategoriesForm(),
              BottonRounded(
                title: 'Next',
                onPressed: () {
                  // print(context.read<PackageData>().selected);
                  // print(context.read<DatePicker>().selected);
                  // print(context.read<TextData>().order);
                  // print(context.read<TextData>().service);
                  // print(context.read<TextData>().name);
                  // print(context.read<TextData>().phone);
                  // print(context.read<TextData>().address);
                  print('ONT Lama = ${context.read<TextData>().oldONT}');
                  print('ONT Baru = ${context.read<TextData>().newONT}');
                },
              ),
            ],
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