import 'package:d_bam/screens/evident_screen/evident_screen.dart';
import 'package:d_bam/screens/material_screen/components/my_datek_form.dart';
import 'package:d_bam/screens/signature_screen.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants.dart';
import 'components/my_categories_filter.dart';
import 'components/my_categories_form.dart';
import 'components/my_metro_form.dart';

class FormMaterial extends StatelessWidget {
  FormMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColour,
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: const EdgeInsets.fromLTRB(
            kPadding, kPadding, kPadding, kVerPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Datek',
              style: kTextStyle16Bold,
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: kPadding,
            ),
            MyDatekForm(),
            SizedBox(
              height: kPadding,
            ),
            MyMetroForm(),
            SizedBox(
              height: kPadding,
            ),
            Text(
              AppLocalizations.of(context)!.titleMaterialOption,
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
            ButtonRounded(
              title: AppLocalizations.of(context)!.buttonNext,
              onPressed: () {
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(
                //     builder: (context) => SignatureScreen(),
                //   ),
                // );

                Navigator.push(
                  context,
                  PageTransition(
                      child: EvidentScreen(),
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
        AppLocalizations.of(context)!.titleMaterial,
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
