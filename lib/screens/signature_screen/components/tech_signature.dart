import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';

import '../../../constants.dart';

class TechnicianSignature extends StatelessWidget {
  const TechnicianSignature({Key? key, required this.technicianControl})
      : super(key: key);

  final HandSignatureControl technicianControl;

  @override
  Widget build(BuildContext context) {
    ValueNotifier<ByteData?> rawImageFit = ValueNotifier<ByteData?>(null);

    // HandSignatureControl technicianControl = HandSignatureControl(
    //   threshold: 0.01,
    //   smoothRatio: 0.65,
    //   velocityRange: 2.0,
    // );

    // print(technicianControl.isFilled);
    Size size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: size.aspectRatio * 2,
      // height: size.height * 0.3,
      child: Stack(
        children: [
          Material(
            elevation: 8,
            shadowColor: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(16),
            ),
            child: Container(
              height: size.height / 4,
              constraints: BoxConstraints.expand(),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(
                  Radius.circular(16),
                ),
              ),
              child: HandSignaturePainterView(
                  width: 0.5,
                  control: technicianControl,
                  type: SignatureDrawType.shape,
                  color: Colors.blue.shade600),
            ),
          ),
          CustomPaint(
            painter: DebugSignaturePainterCP(
              control: technicianControl,
              cp: false,
              cpStart: false,
              cpEnd: false,
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
                    rawImageFit.value = await technicianControl.toImage(
                        color: Colors.red, background: Colors.white);
                    print(technicianControl.isFilled);
                  },
                  icon: const Icon(Icons.check),
                  color: kIcColour,
                ),
                IconButton(
                  icon: const Icon(Icons.clear),
                  color: kIcColour,
                  onPressed: () {
                    technicianControl.clear();
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
