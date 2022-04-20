import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:d_bam/api/models/compress_image.dart';
import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/evident.dart';
import 'package:d_bam/providers/disposable_providers.dart';
import 'package:d_bam/api/pdf_api.dart';
import 'package:d_bam/models/choose_data.dart';
import 'package:d_bam/models/counter.dart';
import 'package:d_bam/models/datepicker.dart';
import 'package:d_bam/models/package_data.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/screens/home_screen/home_screen.dart';
import 'package:d_bam/screens/signature_screen/components/customer_signature.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hand_signature/signature.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:lottie/lottie.dart';

import 'package:provider/provider.dart';

import '../../constants.dart';
import 'components/tech_signature.dart';

class SignatureScreen extends StatefulWidget {
  SignatureScreen({Key? key}) : super(key: key);

  @override
  State<SignatureScreen> createState() => _SignatureScreenState();
}

class _SignatureScreenState extends State<SignatureScreen> {
  final pdfAPI = PdfAPI();
  final compressImage = CompressImage();

  final CategoryData categoryData = CategoryData();
  final ChooseData chooseData = ChooseData();

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
        padding: const EdgeInsets.only(
          left: kPadding,
          right: kPadding,
          top: kPadding,
          bottom: kVerPadding,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              AppLocalizations.of(context)!.customerSignature,
              style: kTextStyle16Bold,
            ),
            const SizedBox(
              height: kPadding,
            ),
            Flexible(
              flex: 3,
              child: CustomerSignature(
                customerControl: customerControl,
              ),
            ),
            const SizedBox(
              height: kPadding,
            ),
            Text(
              AppLocalizations.of(context)!.technicianSignature,
              style: kTextStyle16Bold,
            ),
            const SizedBox(
              height: kPadding,
            ),
            Flexible(
                flex: 3,
                child: TechnicianSignature(
                  technicianControl: technicianControl,
                )),
            const SizedBox(
              height: kPadding,
            ),
            // Spacer(),
            Flexible(
              flex: 1,
              child: ButtonRounded(
                title: AppLocalizations.of(context)!.submitButton,
                onPressed: () async {
                  confirmDialog(context);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<dynamic> confirmDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          title: Text(
            AppLocalizations.of(context)!.confirm,
            style: kTextStyle20Bold,
          ),
          content: Text(
            AppLocalizations.of(context)!.confirm1,
            style: kTextStyle14,
          ),
          elevation: 8,
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text(
                'Cancel',
                style: kTextStyle14Blue,
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, 'OK');
                onSubmit();
                // reset filterchip
                for (int i = 0; i < categoryData.categoryCount; i++) {
                  context.read<CategoryData>().categories[i].isSelected = false;
                }
              },
              child: Text(
                'OK',
                style: kTextStyle14Blue,
              ),
            ),
          ],
        );
      },
    );
  }

  Future onSubmit() async {
    if (technicianControl.isFilled == false ||
        customerControl.isFilled == false) {
      final snackBar = SnackBar(
        content: const Text('Please Fill the Signature First!'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );

      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.grey,
                    backgroundColor: Colors.red,
                  ),
                  const SizedBox(
                    height: kPadding,
                  ),
                  Text(
                    AppLocalizations.of(context)!.alertInfo,
                    style: kTextStyle14White,
                  )
                ],
              ),
            ),
          );
        },
      );
      Future.delayed(Duration(seconds: 3), () {
        return Navigator.pop(context);
      });

      final logoTAPDF = compressImage.getFileImage;
      final List<File> imagesPDF = context.read<Evident>().evidents;
      final imageCus =
          await customerControl.toImage(format: ui.ImageByteFormat.png);
      final imageSignCus = imageCus!.buffer.asUint8List();
      final imageTech =
          await technicianControl.toImage(format: ui.ImageByteFormat.png);
      final imageSignTech = imageTech!.buffer.asUint8List();

      final String? datePDF = context.read<DatePicker>().selected.toString();
      final provTextData = context.read<TextData>();
      final provCounter = context.read<Counter>();
      // final String? typeOSPDF =
      //     context.read<ChooseData>().selected == 'Provisioning'
      //         ? 'Pasang Baru'
      //         : 'Gangguan';
      final String? typeOSPDF = context.read<ChooseData>().selected;
      final String? packagePDF = context.read<PackageData>().selected;
      final String? orderPDF = provTextData.order;
      final String? servicePDF = provTextData.service;
      final String? namePDF = provTextData.name;
      final String? picPDF = provTextData.pic;
      final String? phonePDF = provTextData.phone;
      final String? addressPDF = provTextData.address;
      final String? stoPDF = provTextData.sto;
      final String? odcPDF = provTextData.odc;
      final String? odpPDF = provTextData.odp;
      final String? portPDF = provTextData.port;
      final String? newONTPDF = provTextData.newONT;
      final String? oldONTPDF = provTextData.oldONT;
      final String? newSTBPDF = provTextData.newSTB;
      final String? oldSTBPDF = provTextData.oldSTB;
      final String? descPDF = provTextData.description;
      final String? techNamePDF = provTextData.techName;
      final String? nikPDF = provTextData.nik;
      final String? dropcorePDF = provTextData.dropcore;
      final String? socPDF = provCounter.soc.toString();
      final String? preconn50PDF = provCounter.preconn50.toString();
      final String? preconn80PDF = provCounter.preconn80.toString();
      final String? sClampPDF = provCounter.sClamp.toString();
      final String? clampHookPDF = provCounter.clampHook.toString();
      final String? otpPDF = provCounter.otp.toString();
      final String? preksoPDF = provTextData.prekso;
      final String? rosetPDF = provCounter.roset.toString();
      final String? trayCablePDF = provCounter.trayCable.toString();
      final String? patchcorePDF = provCounter.patchCore.toString();
      final String? cableUTPPDF = provTextData.cableUTP;
      final String? rj45PDF = provCounter.rj45.toString();
      final String? adapterPDF = provCounter.adapter.toString();
      final String? splitter2PDF = provCounter.splitter2.toString();
      final String? splitter4PDF = provCounter.splitter4.toString();
      final String? splitter8PDF = provCounter.splitter8.toString();

      await pdfAPI.getPDF(
        logoTA: logoTAPDF,
        images: imagesPDF,
        signCus: imageSignCus,
        signTech: imageSignTech,
        date: datePDF ?? '-',
        typeOS: typeOSPDF ?? '-',
        package: packagePDF ?? '-',
        noOrder: orderPDF ?? '-',
        serviceID: servicePDF ?? '-',
        contactPhone: phonePDF ?? '-',
        customerName: namePDF ?? '-',
        picName: picPDF ?? '-',
        address: addressPDF ?? '-',
        sto: stoPDF ?? '-',
        odc: odcPDF ?? '-',
        odp: odpPDF ?? '-',
        port: portPDF ?? '-',
        description: descPDF ?? '-',
        newONT: newONTPDF ?? '-',
        oldONT: oldONTPDF ?? '-',
        newSTB: newSTBPDF ?? '-',
        oldSTB: oldSTBPDF ?? '-',
        techName: techNamePDF ?? '-',
        nik: nikPDF ?? '-',
        dropcore: dropcorePDF ?? '-',
        soc: socPDF ?? '-',
        preconn50: preconn50PDF ?? '-',
        preconn80: preconn80PDF ?? '-',
        sCLamp: sClampPDF ?? '-',
        clampHook: clampHookPDF ?? '-',
        otp: otpPDF ?? '-',
        prekso: preksoPDF ?? '-',
        roset: rosetPDF ?? '-',
        trayCable: trayCablePDF ?? '-',
        patchcore: patchcorePDF ?? '-',
        cableUTP: cableUTPPDF ?? '-',
        rj45: rj45PDF ?? '-',
        adapter: adapterPDF ?? '-',
        splitter2: splitter2PDF ?? '-',
        splitter4: splitter4PDF ?? '-',
        splitter8: splitter8PDF ?? '-',
      );
      Future.delayed(Duration(seconds: 4), () {
        final snackOpenPDF = SnackBar(
          elevation: kPadding,
          content: Text(
            AppLocalizations.of(context)!.snackBarPDF,
            style: kTextStyle14White,
          ),
          duration: const Duration(seconds: 15),
          action: SnackBarAction(
            label: 'Open',
            onPressed: () async {
              pdfAPI.pdfOpen(orderPDF!);
              await Future.delayed(Duration(seconds: 3), () async {
                await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              });
            },
          ),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackOpenPDF);
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            actionsAlignment: MainAxisAlignment.center,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            alignment: Alignment.center,
            contentPadding: EdgeInsets.all(kPadding * 2),
            elevation: 8,
            actions: [
              Lottie.asset('assets/lotties/check.json'),
              Center(
                child: TextButton(
                  onPressed: () async {
                    pdfAPI.pdfOpen(orderPDF!);
                    await Future.delayed(Duration(seconds: 3), () async {
                      await Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    });
                  },
                  child: Text(
                    AppLocalizations.of(context)!.snackBarPDF,
                    style: kTextStyle18Blue,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            ],
          ),
        );
      });

      AppProviders.disposeAllDisposableProviders(context);
    }
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
        AppLocalizations.of(context)!.titleSignature,
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
