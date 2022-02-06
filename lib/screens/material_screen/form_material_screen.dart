import 'package:d_bam/screens/signature_screen.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';

import '../../constants.dart';
import 'components/my_categories_filter.dart';
import 'components/my_categories_form.dart';

class FormMaterial extends StatelessWidget {
  FormMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColour,
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(
            kPadding, kPadding, kPadding, kVerPadding),
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
            Expanded(
              child: MyCategoriesForm(),
            ),
            BottonRounded(
              title: 'Next',
              onPressed: () {
                Navigator.push(
                  context,
                  PageTransition(
                      child: SignatureScreen(),
                      type: PageTransitionType.rightToLeftWithFade),
                );
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
