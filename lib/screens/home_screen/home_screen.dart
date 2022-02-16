import 'dart:io' show Platform, exit;

import 'package:d_bam/screens/choose_screen/choose_screen.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:page_transition/page_transition.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../constants.dart';
import 'components/locale_dropdown.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  DateTime? currentBackPressTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      backgroundColor: kBgColour,
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kHorPadding,
            vertical: kVerPadding,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    child: SvgPicture.asset(
                      'assets/icons/ic_menu.svg',
                    ),
                    onTap: () {},
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
              LocaleDropdown(),
              Spacer(),
              Expanded(
                flex: 2,
                child: SvgPicture.asset(
                  'assets/images/img_blank.svg',
                  height: 300,
                  width: 300,
                ),
              ),
              const SizedBox(
                height: 78,
              ),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.labelHome,
                  style: kTextStyle20,
                  textAlign: TextAlign.center,
                ),
              ),
              Spacer(),
              BottonRounded(
                title: AppLocalizations.of(context)!.buttonCreateBA,
                onPressed: () {
                  Navigator.push(
                    context,
                    PageTransition(
                        child: ChooseScreen(),
                        type: PageTransitionType.rightToLeft),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(msg: 'Pencet sekali lagi a supaya keluar 🤭');
      return Future.value(false);
    }
    Platform.isAndroid ? SystemNavigator.pop() : exit(0);
    return Future.value(true);
  }
}
