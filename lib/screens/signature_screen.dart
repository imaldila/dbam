import 'dart:typed_data';

import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hand_signature/signature.dart';

import '../constants.dart';

class SignatureScreen extends StatefulWidget {
  SignatureScreen({Key? key}) : super(key: key);

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  ValueNotifier<String?> svg = ValueNotifier<String?>(null);
  ValueNotifier<ByteData?> rawImageFit = ValueNotifier<ByteData?>(null);

  HandSignatureControl customerControl = HandSignatureControl(
    threshold: 0.01,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );

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
            Text(
              'Customer Signature',
              style: kTextStyle16Bold,
            ),
            SizedBox(
              height: kPadding,
            ),
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
                Expanded(
                  child: Center(
                    child: AspectRatio(
                      aspectRatio: 1.6,
                      child: Stack(
                        children: <Widget>[
                          Container(
                            constraints: BoxConstraints.expand(),
                            color: Colors.white,
                            child: HandSignaturePainterView(
                              control: customerControl,
                              type: SignatureDrawType.shape,
                            ),
                          ),
                          CustomPaint(
                            painter: DebugSignaturePainterCP(
                              control: customerControl,
                              cp: false,
                              cpStart: false,
                              cpEnd: false,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 15,
                  left: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () async {
                          // if (signatureController.isNotEmpty) {
                          //   final Uint8List? data =
                          //       await signatureController.toPngBytes();
                          //   if (data != null) {
                          //     Image.memory(data);
                          //   }
                          // }
                          // setState(() {});
                          rawImageFit.value = await customerControl.toImage(
                              color: Colors.red, background: Colors.white);
                        },
                        icon: const Icon(Icons.check),
                        color: kIcColour,
                      ),
                      IconButton(
                        icon: const Icon(Icons.clear),
                        color: kIcColour,
                        onPressed: () {
                          customerControl.clear();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            
            SizedBox(
              height: kPadding,
            ),
            BottonRounded(
                title: 'test',
                onPressed: () {
                  print(rawImageFit);
                }),
            Align(
              alignment: Alignment.bottomRight,
              child: _buildScaledImageView(),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildScaledImageView() => Container(
        width: 192.0,
        height: 96.0,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white30,
        ),
        child: ValueListenableBuilder<ByteData?>(
          valueListenable: rawImageFit,
          builder: (context, data, child) {
            if (data == null) {
              return Container(
                color: Colors.red,
                child: Center(
                  child: Text('not signed yet (png)\nscaleToFill: true'),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.all(8.0),
                child: Image.memory(data.buffer.asUint8List()),
              );
            }
          },
        ),
      );

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
