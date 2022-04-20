import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';

import '../../../constants.dart';

class CustomerSignature extends StatelessWidget {
  const CustomerSignature({Key? key, required this.customerControl})
      : super(key: key);

  final HandSignatureControl customerControl;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    ValueNotifier<ByteData?> rawImageFit = ValueNotifier<ByteData?>(null);
    // print(size.height * 0.3);
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
                  control: customerControl,
                  type: SignatureDrawType.shape,
                  color: Colors.blue.shade600),
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
          Positioned(
            bottom: 0,
            right: 15,
            left: 15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () async {
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
    );
  }
}
