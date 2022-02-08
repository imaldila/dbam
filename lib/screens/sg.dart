import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hand_signature/signature.dart';

class Sg extends StatefulWidget {
  Sg({Key? key}) : super(key: key);

  @override
  State<Sg> createState() => _SgState();
}

class _SgState extends State<Sg> {
  bool get scrollTest => false;

  HandSignatureControl control = HandSignatureControl(
    threshold: 0.01,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );

  ValueNotifier<String?> svg = ValueNotifier<String?>(null);

  ValueNotifier<ByteData?> rawImage = ValueNotifier<ByteData?>(null);

  ValueNotifier<ByteData?> rawImageFit = ValueNotifier<ByteData?>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.orange,
      body: scrollTest
          ? Sg()
          : SafeArea(
              child: Stack(
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Expanded(
                        child: Center(
                          child: AspectRatio(
                            aspectRatio: 2.0,
                            child: Stack(
                              children: <Widget>[
                                Container(
                                  constraints: BoxConstraints.expand(),
                                  color: Colors.white,
                                  child: HandSignaturePainterView(
                                    control: control,
                                    type: SignatureDrawType.shape,
                                  ),
                                ),
                                CustomPaint(
                                  painter: DebugSignaturePainterCP(
                                    control: control,
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
                      Row(
                        children: <Widget>[
                          CupertinoButton(
                            onPressed: () {
                              control.clear();
                              svg.value = null;
                              rawImage.value = null;
                              rawImageFit.value = null;
                            },
                            child: Text('clear'),
                          ),
                          CupertinoButton(
                            onPressed: () async {
                              svg.value = control.toSvg(
                                color: Colors.blueGrey,
                                size: 2.0,
                                maxSize: 15.0,
                                type: SignatureDrawType.shape,
                              );

                              rawImage.value = await control.toImage(
                                color: Colors.blueAccent,
                                background: Colors.greenAccent,
                                fit: false,
                              );

                              rawImageFit.value = await control.toImage(
                                color: Colors.blueAccent,
                                background: Colors.greenAccent,
                              );
                            },
                            child: Text('export'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.0,
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        _buildImageView(),
                        _buildScaledImageView(),
                        _buildSvgView(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildImageView() => Container(
        width: 192.0,
        height: 96.0,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white30,
        ),
        child: ValueListenableBuilder<ByteData?>(
          valueListenable: rawImage,
          builder: (context, data, child) {
            if (data == null) {
              return Container(
                color: Colors.red,
                child: Center(
                  child: Text('not signed yet (png)\nscaleToFill: false'),
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

  Widget _buildSvgView() => Container(
        width: 192.0,
        height: 96.0,
        decoration: BoxDecoration(
          border: Border.all(),
          color: Colors.white30,
        ),
        child: ValueListenableBuilder<String?>(
          valueListenable: svg,
          builder: (context, data, child) {
            return HandSignatureView.svg(
              data: data,
              padding: EdgeInsets.all(8.0),
              placeholder: Container(
                color: Colors.red,
                child: Center(
                  child: Text('not signed yet (svg)'),
                ),
              ),
            );
          },
        ),
      );
}
