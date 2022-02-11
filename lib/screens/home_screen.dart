import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/datepicker.dart';
import 'package:d_bam/models/package_data.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/screens/choose_screen/choose_screen.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColour,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorPadding,
          vertical: kVerPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    'assets/icons/ic_menu.svg',
                  ),
                  CircleAvatar(
                    backgroundColor: kBgColour,
                    child: Image.asset(
                      'assets/images/logo1.png',
                      fit: BoxFit.cover,
                    ),
                    radius: 24,
                  ),
                ],
              ),
            ),
            Expanded(
              child: SvgPicture.asset(
                'assets/images/img_blank.svg',
                height: 300,
                width: 300,
              ),
            ),
            const SizedBox(
              height: 78,
            ),
            Text(
              'Hi, Technician don’t forget to create BA after you done work. Thank You !',
              style: kTextStyle20,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            BottonRounded(
              title: 'Create BA',
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: ChooseScreen(),
                      type: PageTransitionType.rightToLeft),
                );
               
                // print(context.read<PackageData>().selected ?? '');
                // print(context.read<DatePicker>().selected ?? '');
                // print(context.read<TextData>().order);
                // print(context.read<TextData>().service);
                // print(context.read<TextData>().name);
                // print(context.read<TextData>().phone);
                // print(context.read<TextData>().techName);
                // print(context.read<TextData>().address);
              },
            ),
          ],
        ),
      ),
    );
  }
}
