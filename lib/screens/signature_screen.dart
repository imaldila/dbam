import 'dart:typed_data';

import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:signature/signature.dart';

import '../constants.dart';

class SignatureScreen extends StatefulWidget {
  SignatureScreen({Key? key}) : super(key: key);

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final SignatureController signatureController = SignatureController(
      penStrokeWidth: 2,
      penColor: Colors.red,
      exportBackgroundColor: Colors.blue,
      onDrawStart: () => print('onDrawStart called!'),
      onDrawEnd: () => print('onDrawEnd called!'));

  bool isClicked = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: buildAppBar(context),
      body: Padding(
        padding: const EdgeInsets.all(kPadding),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Material(
                  elevation: 8,
                  shadowColor: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8)),
                  child: Container(
                    height: size.height / 4,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8))),
                  ),
                ),
                AbsorbPointer(
                  absorbing: (isClicked = !isClicked) ? true : false,
                  child: Signature(
                    width: size.width / 1.2,
                    controller: signatureController,
                    height: size.height / 4,
                    backgroundColor: Colors.white24,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {});
                  },
                  icon: Icon(Icons.edit),
                  color: kIcColour,
                ),
              ],
            ),
            IconButton(
              onPressed: () async {
                if (signatureController.isNotEmpty) {
                  final Uint8List? data =
                      await signatureController.toPngBytes();
                  if (data != null) {
                    Image.memory(data);
                  }
                }
                setState(() {});
              },
              icon: const Icon(Icons.check),
              color: kIcColour,
            ),
            IconButton(
              icon: const Icon(Icons.clear),
              color: kIcColour,
              onPressed: () {
                signatureController.clear();
              },
            ),
            BottonRounded(
                title: 'test',
                onPressed: () {
                  print(signatureController);
                })
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
        'Signature Form',
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
