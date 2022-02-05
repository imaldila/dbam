import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:d_bam/api/pdf_api.dart';
import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/counter.dart';
import 'package:d_bam/models/datepicker.dart';
import 'package:d_bam/models/package_data.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/screens/home_screen.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hand_signature/signature.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:pdf/widgets.dart' as pw;

import '../constants.dart';

class SignatureScreen extends StatefulWidget {
  SignatureScreen({Key? key}) : super(key: key);

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final pdfAPI = PdfAPI();
  final pdf = pw.Document();

  ValueNotifier<String?> svg = ValueNotifier<String?>(null);
  ValueNotifier<ByteData?> rawImageFit = ValueNotifier<ByteData?>(null);

  HandSignatureControl customerControl = HandSignatureControl(
    threshold: 0.01,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );
  HandSignatureControl technicianControl = HandSignatureControl(
    threshold: 0.01,
    smoothRatio: 0.65,
    velocityRange: 2.0,
  );

  bool isClicked = false;

  @override
  void dispose() {
    customerControl.dispose();
    technicianControl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
            customerSignature(),
            SizedBox(
              height: kPadding,
            ),
            Text(
              'Technician Signature',
              style: kTextStyle16Bold,
            ),
            SizedBox(
              height: kPadding,
            ),
            technicianSignature(),
            SizedBox(
              height: kPadding,
            ),
            Spacer(),
            BottonRounded(
              title: 'Submit',
              onPressed: () async {
                // await showDialog(
                //   context: context,
                //   builder: (context) => Center(
                //     child: CircularProgressIndicator(
                //       color: Colors.grey,
                //       backgroundColor: Colors.red,
                //     ),
                //   ),
                // );

                // Navigator.pop(context);
                onSubmit();
                print(technicianControl.toImage());
                print(context.read<PackageData>().selected);
                print(context.read<DatePicker>().selected);
                print(context.read<TextData>().order);
                print(context.read<TextData>().service);
                print(context.read<TextData>().name);
                print(context.read<TextData>().phone);
                print(context.read<TextData>().address);
                print('ONT Lama = ${context.read<TextData>().oldONT}');
                print('ONT Baru = ${context.read<TextData>().newONT}');
                print('STB Lama = ${context.read<TextData>().oldSTB}');
                print('STB Baru = ${context.read<TextData>().newSTB}');
                print('SDWAN Lama = ${context.read<TextData>().oldSDWAN}');
                print('SDWAN Baru = ${context.read<TextData>().newSDWAN}');
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

                // await Navigator.pushAndRemoveUntil(
                //   context,
                //   MaterialPageRoute(builder: (context) => HomeScreen()),
                //   (Route<dynamic> route) => false,
                // );
              },
            ),
            // Align(
            //   alignment: Alignment.bottomRight,
            //   child: _buildScaledImageView(),
            // )
          ],
        ),
      ),
    );
  }

  Future onSubmit() async {
    if (technicianControl.isFilled == false ||
        customerControl.isFilled == false) {
      final snackBar = SnackBar(
        content: const Text('Please Fill the Signature First!'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {
            // Some code to undo the change.
          },
        ),
      );

      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      );
      final imageCus =
          await customerControl.toImage(format: ui.ImageByteFormat.png);
      final imageSignCus = imageCus!.buffer.asUint8List();
      final imageTech =
          await technicianControl.toImage(format: ui.ImageByteFormat.png);
      final imageSignTech = imageTech!.buffer.asUint8List();

      await pdfAPI.getPDF(signCus: imageSignCus, signTech: imageSignTech);

      Navigator.of(context).pop();
    }
  }

  AspectRatio customerSignature() {
    print(customerControl.isFilled);
    Size size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 1.65,
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
                    print(customerControl.isFilled);
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

  AspectRatio technicianSignature() {
    print(technicianControl.isFilled);
    Size size = MediaQuery.of(context).size;
    return AspectRatio(
      aspectRatio: 1.65,
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

  // ignore: unused_element
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
