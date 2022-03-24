import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:page_transition/page_transition.dart';

import '../../constants.dart';

import '../signature_screen/signature_screen.dart';
import 'components/evident_images.dart';

class EvidentScreen extends StatelessWidget {
  const EvidentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                AppLocalizations.of(context)!.evident,
                style: kTextStyle16Bold,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: kPadding,
              ),
              EvidentImages(),
              const SizedBox(
                height: kPadding,
              ),
              ButtonRounded(
                title: AppLocalizations.of(context)!.buttonNext,
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: SignatureScreen(),
                        type: PageTransitionType.rightToLeftWithFade),
                  );
                },
              ),
              const SizedBox(
                height: kPadding,
              ),
              Text(
                AppLocalizations.of(context)!.optinal,
                style: kTextStyle14,
                textAlign: TextAlign.center,
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
        'Upload Evident',
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
