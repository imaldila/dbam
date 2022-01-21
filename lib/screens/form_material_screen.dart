import 'package:d_bam/models/counter.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/screens/sg.dart';
import 'package:d_bam/screens/signature_screen.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:d_bam/widgets/my_categories_filter.dart';
import 'package:d_bam/widgets/my_categories_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
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
      body: Padding(
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
                // print(context.read<PackageData>().selected);
                // print(context.read<DatePicker>().selected);
                // print(context.read<TextData>().order);
                // print(context.read<TextData>().service);
                // print(context.read<TextData>().name);
                // print(context.read<TextData>().phone);
                // print(context.read<TextData>().address);
                print('ONT Lama = ${context.read<TextData>().oldONT}');
                print('ONT Baru = ${context.read<TextData>().newONT}');
                print('Dropcore = ${context.read<TextData>().dropcore} Meter');
                print('Preconn50 = ${context.read<Counter>().preconn50} /pcs');
                print('Preconn80 = ${context.read<Counter>().preconn80} /pcs');
                print('RJ45 = ${context.read<Counter>().rj45} /pcs');
                print('S-Clamp = ${context.read<Counter>().sClamp} /pcs');
                print('Clamp Hook = ${context.read<Counter>().clampHook} /pcs');
                print('Roset = ${context.read<Counter>().roset} /pcs');
                print('SOC = ${context.read<Counter>().soc} /pcs');
                print('Tray Cable = ${context.read<Counter>().trayCable} /pcs');
                print('Patchcore = ${context.read<Counter>().patchCore} /pcs');
                print('Cable UTP = ${context.read<Counter>().cableUTP} /pcs');
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
