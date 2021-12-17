import 'package:d_bam/constants.dart';
import 'package:d_bam/screens/form_gangguan_screen.dart';
import 'package:d_bam/widgets/my_option_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:page_transition/page_transition.dart';

class ChooseScreen extends StatelessWidget {
  const ChooseScreen({Key? key}) : super(key: key);
  static const String id = 'Choose Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColour,
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: kHorPadding,
          vertical: 24,
        ),
        child: Center(
          child: Column(
            children: [
              Text('Please Select One', style: kTextStyle24),
              SizedBox(
                height: kPadding,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {},
                  child: OptionCard(
                    svgPicture: SvgPicture.asset('assets/images/img_psb.svg'),
                  ),
                ),
              ),
              SizedBox(
                height: kPadding,
              ),
              Text(
                'PSB',
                style: kTextStyle20Bold,
              ),
              SizedBox(
                height: kPadding,
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          child: FormGangguan(),
                          type: PageTransitionType.rightToLeft),
                    );
                  },
                  child: OptionCard(
                    svgPicture: SvgPicture.asset('assets/images/img_ggn.svg'),
                  ),
                ),
              ),
              SizedBox(
                height: kPadding,
              ),
              Text(
                'Gangguan',
                style: kTextStyle20Bold,
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
