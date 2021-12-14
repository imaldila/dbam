import 'package:d_bam/constants.dart';
import 'package:d_bam/widgets/option_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';


class ChooseScreen extends StatelessWidget {
  const ChooseScreen({Key? key}) : super(key: key);
  static const String id = 'Choose Screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColour,
      appBar: buildAppBar(context),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(kPadding),
          child: Column(
            children: [
              Text(
                'Please Select One',
                style: kTextStyle24
              ),
              SizedBox(
                height: kPadding,
              ),
              OptionCard(
                svgPicture: SvgPicture.asset('assets/images/img_psb.svg'),
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
              OptionCard(
                svgPicture: SvgPicture.asset('assets/images/img_ggn.svg'),
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
      // centerTitle: true,
      // title: Text('Please select one', style: kTextStyle20Bold,),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorPadding),
          child: CircleAvatar(
            backgroundColor: Colors.white,
            child: Icon(
              Icons.person,
              color: kIcColour,
            ),
          ),
        ),
      ],
      shadowColor: kBgColour,
    );
  }
}
