import 'dart:io';

import 'dart:typed_data';
import 'package:d_bam/api/components/pw_address_label.dart';
import 'package:d_bam/api/components/pw_datek.dart';
import 'package:d_bam/api/components/pw_material.dart';
import 'package:d_bam/api/components/pw_nte_label.dart';
import 'package:d_bam/api/components/pw_pic_label.dart';
import 'package:d_bam/constants.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'components/pw_customer_label.dart';
import 'components/pw_nte.dart';
import 'components/pw_signature.dart';

class PdfAPI {
  final pdf = pw.Document();

  getPDF({
    required Uint8List signCus,
    required Uint8List signTech,
    required String date,
    typeOS,
    package,
    noOrder,
    serviceID,
    picName,
    contactPhone,
    customerName,
    address,
    sto,
    odc,
    odp,
    port,
    metro,
    newONT,
    oldONT,
    newSTB,
    oldSTB,
    oldOTHER,
    newOTHER,
    dropcore,
    soc,
    preconn50,
    preconn80,
    sCLamp,
    clampHook,
    otp,
    prekso,
    roset,
    trayCable,
    patchcore,
    cableUTP,
    rj45,
    adapter,
    splitter2,
    splitter4,
    splitter8,
    techName,
    nik,
  }) async {
    var dataImageTA = await rootBundle.load('assets/images/logo_ta.png');
    var myImageTA = dataImageTA.buffer.asUint8List();

    var dataImageTelkom =
        await rootBundle.load('assets/images/logo_telkom.png');
    var myImageTelkom = dataImageTelkom.buffer.asUint8List();

    final myFontBold = await PdfGoogleFonts.poppinsSemiBold();
    final myFont = await PdfGoogleFonts.poppinsRegular();
    final myFontItalic = await PdfGoogleFonts.poppinsItalic();

    pdf.addPage(
      pw.Page(
        theme: pw.ThemeData.withFont(
            icons: await PdfGoogleFonts.materialIcons(),
            base: myFont,
            bold: myFont),
        margin: pw.EdgeInsets.fromLTRB(36, 16, 36, 36),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              headerPDF(myImageTA, myImageTelkom, myFontBold),
              pw.Divider(),
              pw.SizedBox(height: kPadding / 1.5),
              CustomerLabel(
                  label: 'Jenis Layanan', value: typeOS, font: myFontBold),
              pw.SizedBox(height: kPadding / 3),
              pw.Text(
                kHeadDesc,
                style: pw.TextStyle(fontSize: 10),
              ),
              pw.SizedBox(height: kPadding / 3),
              pw.Text(
                'Detail Pelanggan :',
                style: pw.TextStyle(font: myFontBold, fontSize: 10),
              ),
              pw.SizedBox(height: kPadding / 3),
              customerPDF(
                date,
                package,
                typeOS,
                noOrder,
                serviceID,
                contactPhone,
                customerName,
                picName,
                address,
              ),
              pw.SizedBox(height: kPadding / 3),
              pw.Text(
                'Datek :',
                style: pw.TextStyle(font: myFontBold, fontSize: 10),
              ),
              pw.SizedBox(height: kPadding / 3),
              datekPDF(myFontBold, sto, odc, odp, port, metro),
              pw.SizedBox(height: kPadding / 3),
              pw.Text(
                'Detail Material :',
                style: pw.TextStyle(font: myFontBold, fontSize: 10),
              ),
              pw.SizedBox(height: kPadding / 3),
              ntePDF(myFontBold, newONT, oldONT, newSTB, oldSTB, newOTHER,
                  oldOTHER),
              pw.SizedBox(height: kPadding / 3),
              pw.Divider(thickness: 0.1, color: PdfColors.grey),
              materialPDF(
                  dropcore,
                  soc,
                  preconn50,
                  preconn80,
                  sCLamp,
                  clampHook,
                  otp,
                  prekso,
                  roset,
                  trayCable,
                  patchcore,
                  cableUTP,
                  rj45,
                  adapter,
                  splitter2,
                  splitter4,
                  splitter8,
                  context),
              pw.SizedBox(height: kPadding / 3),
              disclaimerPDF(myFontItalic),
              pw.Spacer(),
              signaturePDF(signCus, signTech, picName, date, techName, nik),
            ],
          );
        },
      ),
    );
    pdfOpen(noOrder);
  }

  void pdfOpen(String noOrder) async {
    // save
    Uint8List bytes = await pdf.save();

    // buat file kosong di directory

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/$noOrder.pdf');

    // timpa file kosong dengan file pdf
    await file.writeAsBytes(bytes);

    // open pdf
    await OpenFile.open(file.path);
  }

  headerPDF(Uint8List myImageTA, myImageTelkom, pw.Font myFontBold) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Container(
          width: 60,
          height: 40,
          child: pw.Image(
            pw.MemoryImage(myImageTA),
          ),
        ),
        pw.Container(
          child: pw.Text('BERITA ACARA INSTALASI',
              style: pw.TextStyle(font: myFontBold, fontSize: 14)),
        ),
        pw.Container(
          width: 60,
          height: 40,
          child: pw.Image(
            pw.MemoryImage(myImageTelkom),
          ),
        )
      ],
    );
  }

  customerPDF(
    String date,
    package,
    typeOS,
    noOrder,
    serviceID,
    contactPhone,
    customerName,
    picName,
    address,
  ) {
    return pw.Column(
      children: [
        // pw.Row(
        //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
        //   children: [
        //     CustomerLabel(label: 'Tanggal', value: date),
        //     CustomerLabel(label: 'Jenis Layanan', value: typeOS),
        //   ],
        // ),
        // pw.SizedBox(height: kPadding / 2),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            CustomerLabel(label: 'Jenis Paket', value: package),
            CustomerLabel(label: 'No Order', value: noOrder),
          ],
        ),
        pw.SizedBox(height: kPadding / 2),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            CustomerLabel(label: 'Service ID', value: serviceID),
            CustomerLabel(label: 'Nama Pelanggan', value: customerName),
          ],
        ),
        pw.SizedBox(height: kPadding / 2),
        // CustomerLabel(label: 'PIC / No Hp', value: '$picName / $contactPhone'),
        PICLabel(label: 'PIC / No Hp', value: '$picName / $contactPhone'),
        pw.SizedBox(height: kPadding / 2),
        AddressLabel(label: 'Alamat', value: address),
      ],
    );
  }

  datekPDF(pw.Font myFontBold, String sto, odc, odp, port, metro) {
    return pw.Row(
      children: [
        PWDatek(font: myFontBold, label: 'STO :', value: sto),
        pw.SizedBox(width: kPadding),
        PWDatek(font: myFontBold, label: 'ODC :', value: odc),
        pw.SizedBox(width: kPadding),
        PWDatek(font: myFontBold, label: 'ODP :', value: odp),
        pw.SizedBox(width: kPadding),
        PWDatek(font: myFontBold, label: 'Port : ', value: port),
        pw.SizedBox(width: kPadding),
        PWDatek(font: myFontBold, label: 'Metro : ', value: metro),
      ],
    );
  }

  ntePDF(pw.Font myFontBold, String newONT, oldONT, newSTB, oldSTB, oldOTHER,
      newOTHER) {
    return pw.Column(
      children: [
        NTELabel(font: myFontBold),
        (newONT != '' || oldONT != '')
            ? NTE(
                labelNTE: 'ONT / MODEM',
                newNTE: newONT,
                oldNTE: oldONT,
              )
            : pw.Container(),
        (newSTB != '' || oldSTB != '')
            ? NTE(
                labelNTE: 'STB',
                newNTE: newSTB,
                oldNTE: oldSTB,
              )
            : pw.Container(),
        NTE(
          oldNTE: oldOTHER,
          newNTE: newOTHER,
          labelNTE: 'LAINNYA',
        ),
      ],
    );
  }

  materialPDF(
      String dropcore,
      soc,
      preconn50,
      preconn80,
      sCLamp,
      clampHook,
      otp,
      prekso,
      roset,
      trayCable,
      patchcore,
      cableUTP,
      rj45,
      adapter,
      splitter2,
      splitter4,
      splitter8,
      context) {
    return pw.Wrap(
      spacing: kPadding * 2,
      alignment: pw.WrapAlignment.spaceBetween,
      children: [
        (dropcore != '')
            ? PWMaterial(title: 'Dropcore', value: dropcore, unit: 'Meter')
            : pw.Container(),
        (soc != 0.toString())
            ? PWMaterial(title: 'SOC', value: soc, unit: 'Pcs')
            : pw.Container(),
        (preconn50 != 0.toString())
            ? PWMaterial(title: 'Precon 50', value: preconn50, unit: 'Pcs')
            : pw.Container(),
        (preconn80 != 0.toString())
            ? PWMaterial(title: 'Precon 80', value: preconn80, unit: 'Pcs')
            : pw.Container(),
        (sCLamp != 0.toString())
            ? PWMaterial(title: 'S-Clamp', value: sCLamp, unit: 'Pcs')
            : pw.Container(),
        (clampHook != 0.toString())
            ? PWMaterial(title: 'Clamp Hook', value: clampHook, unit: 'Pcs')
            : pw.Container(),
        (splitter2 != 0.toString())
            ? PWMaterial(title: 'Splitter 1:2', value: splitter2, unit: 'Pcs')
            : pw.Container(),
        (splitter4 != 0.toString())
            ? PWMaterial(title: 'Splitter 1:4', value: splitter4, unit: 'Pcs')
            : pw.Container(),
        (splitter8 != 0.toString())
            ? PWMaterial(title: 'Splitter 1:8', value: splitter8, unit: 'Pcs')
            : pw.Container(),
        (otp != 0.toString())
            ? PWMaterial(title: 'OTP', value: otp, unit: 'Pcs')
            : pw.Container(),
        (prekso != 0.toString())
            ? PWMaterial(title: 'Prekso', value: prekso, unit: 'Meter')
            : pw.Container(),
        (roset != 0.toString())
            ? PWMaterial(title: 'Roset', value: roset, unit: 'Pcs')
            : pw.Container(),
        (patchcore != 0.toString())
            ? PWMaterial(title: 'Patchcore', value: patchcore, unit: 'Pcs')
            : pw.Container(),
        (trayCable != 0.toString())
            ? PWMaterial(title: 'Tray Cable', value: trayCable, unit: 'Pcs')
            : pw.Container(),
        (cableUTP != '')
            ? PWMaterial(title: 'Cable UTP', value: cableUTP, unit: 'Meter')
            : pw.Container(),
        (adapter != 0.toString())
            ? PWMaterial(title: 'Adapter', value: adapter, unit: 'Pcs')
            : pw.Container(),
        (rj45 != 0.toString())
            ? PWMaterial(title: 'RJ 45', value: rj45, unit: 'Pcs')
            : pw.Container(),
      ],
    );

    //  pw.Column(
    //   children: [
    //     // pw.Row(
    //     //   mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //     //   children: [
    //     //     if (dropcore != '' || otp != 0.toString())
    //     //       PWMaterial(title: 'Dropcore', value: dropcore, unit: 'Meter')
    //     //     else
    //     //       PWMaterial(title: 'OTP', value: otp, unit: 'Pcs'),

    //     //     pw.Container()
    //     //     // (dropcore != '')
    //     //     //     ? PWMaterial(title: 'Dropcore', value: dropcore, unit: 'Meter')
    //     //     //     : (otp != 0.toString())
    //     //     //         ? PWMaterial(title: 'OTP', value: otp, unit: 'Pcs')
    //     //     //         : pw.Container(),
    //     //   ],
    //     // ),
    //     pw.Row(
    //       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //       children: [
    //         PWMaterial(title: 'SOC', value: soc, unit: 'Pcs'),
    //         PWMaterial(title: 'Prekso', value: prekso ?? '-', unit: 'Pcs'),
    //       ],
    //     ),
    //     pw.Row(
    //       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //       children: [
    //         PWMaterial(title: 'Precon 50', value: preconn50, unit: 'Pcs'),
    //         PWMaterial(title: 'Roset', value: roset, unit: 'Pcs'),
    //       ],
    //     ),
    //     pw.Row(
    //       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //       children: [
    //         PWMaterial(title: 'Precon 80', value: preconn80, unit: 'Pcs'),
    //         PWMaterial(title: 'Patchcore', value: patchcore, unit: 'Pcs'),
    //       ],
    //     ),
    //     pw.Row(
    //       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //       children: [
    //         PWMaterial(title: 'S-Clamp', value: sCLamp, unit: 'Pcs'),
    //         PWMaterial(title: 'Tray Cable', value: trayCable, unit: 'Pcs'),
    //       ],
    //     ),
    //     pw.Row(
    //       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //       children: [
    //         PWMaterial(title: 'Clamp Hook', value: clampHook, unit: 'Pcs'),
    //         PWMaterial(title: 'Cable UTP', value: cableUTP, unit: 'Meter'),
    //       ],
    //     ),
    //     pw.Row(
    //       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //       children: [
    //         PWMaterial(title: 'Splitter 1:2', value: splitter2, unit: 'Pcs'),
    //         PWMaterial(title: 'Adapter', value: adapter, unit: 'Pcs'),
    //       ],
    //     ),
    //     pw.Row(
    //       mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
    //       children: [
    //         PWMaterial(title: 'Splitter 1:4', value: splitter4, unit: 'Pcs'),
    //         PWMaterial(title: 'RJ 45', value: rj45, unit: 'Pcs'),
    //       ],
    //     ),
    //     PWMaterial(title: 'Splitter 1:8', value: splitter8, unit: 'Pcs'),
    //   ],
    // );
  }

  disclaimerPDF(pw.Font myFontItalic) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Disclaimer :',
            style: pw.TextStyle(font: myFontItalic, fontSize: 10)),
        pw.SizedBox(height: kPadding / 3),
        pw.Text(
          kDisclaimer1,
          style: pw.TextStyle(fontSize: 6, font: myFontItalic),
          textAlign: pw.TextAlign.justify,
        ),
        pw.Text(
          kDisclaimer2,
          style: pw.TextStyle(fontSize: 6, font: myFontItalic),
          textAlign: pw.TextAlign.justify,
        ),
        pw.Text(
          kDisclaimer3,
          style: pw.TextStyle(fontSize: 6, font: myFontItalic),
          textAlign: pw.TextAlign.justify,
        ),
        pw.Text(
          kDisclaimer4,
          style: pw.TextStyle(fontSize: 6, font: myFontItalic),
          textAlign: pw.TextAlign.justify,
        ),
        pw.Text(
          kDisclaimer5,
          style: pw.TextStyle(fontSize: 6, font: myFontItalic),
          textAlign: pw.TextAlign.justify,
        ),
        pw.SizedBox(height: kPadding / 3),
        pw.Text(
          'Demikian berita acara ini dibuat untuk dapat dipergunakan seperlunya.',
          style: pw.TextStyle(fontSize: 6, font: myFontItalic),
          textAlign: pw.TextAlign.justify,
        ),
      ],
    );
  }

  signaturePDF(
      Uint8List signTech, signCus, String picName, date, techName, nik) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        PWSignature(
          dateLabel: '_',
          labelName: 'Pelanggan',
          signature: signTech.buffer.asUint8List(),
          name: picName,
        ),
        PWSignature(
          dateLabel: 'Bandung, $date',
          labelName: 'Teknisi',
          signature: signCus.buffer.asUint8List(),
          name: '$techName / $nik',
        ),
      ],
    );
  }
}
