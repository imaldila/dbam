import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants.dart';

class FormMaterial extends StatelessWidget {
  const FormMaterial({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: buildAppBar(context),
        body: ListView(
            padding: EdgeInsets.symmetric(
              vertical: 24,
              horizontal: kHorPadding,
            ),
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      FittedBox(
                        fit: BoxFit.none,
                        child: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(16),
                          shadowColor: Colors.white,
                          child: Container(
                            decoration: kStyleBoxDecoration,
                            padding: EdgeInsets.all(kPadding),
                            height: size.height / 14.5,
                            child: Text('ONT', style: kTextStyle16Bold),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.none,
                        child: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(16),
                          shadowColor: Colors.white,
                          child: Container(
                            decoration: kStyleBoxDecoration,
                            padding: EdgeInsets.all(kPadding),
                            height: size.height / 14.5,
                            child: Text('STB', style: kTextStyle16Bold),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.none,
                        child: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(16),
                          shadowColor: Colors.white,
                          child: Container(
                            decoration: kStyleBoxDecoration,
                            padding: EdgeInsets.all(kPadding),
                            height: size.height / 14.5,
                            child: Text('SD WAN', style: kTextStyle16Bold),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.none,
                        child: Material(
                          elevation: 8,
                          borderRadius: BorderRadius.circular(16),
                          shadowColor: Colors.white,
                          child: Container(
                            decoration: kStyleBoxDecoration,
                            padding: EdgeInsets.all(kPadding),
                            height: size.height / 14.5,
                            child: Text('DropCore', style: kTextStyle16Bold),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(),
                  Text('Data')
                ],
              ),
            ]));
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
