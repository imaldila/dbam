import 'dart:ui';

import 'package:d_bam/screens/choose_screen.dart';
import 'package:d_bam/widgets/button_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const String id = 'Home Screen';

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
                    ('assets/icons/ic_menu.svg'),
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Icon(Icons.person),
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
            SizedBox(
              height: 78,
            ),
            Text(
              'Hi, Samantha don’t forget to create BA after you done work. Thank You !',
              style: kTextStyle20,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            BottonRounded(
              title: 'Create BA',
              onPressed: () {
                Navigator.pushNamed(context, ChooseScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
