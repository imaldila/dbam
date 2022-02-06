import 'dart:io';

import 'dart:typed_data';
import 'package:d_bam/api/components/pw_address_label.dart';
import 'package:d_bam/constants.dart';
import 'package:flutter/cupertino.dart';
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
  }) async {
    var dataImageTA = await rootBundle.load('assets/images/logo_ta.png');
    var myImageTA = dataImageTA.buffer.asUint8List();

    var dataImageTelkom =
        await rootBundle.load('assets/images/logo_telkom.png');
    var myImageTelkom = dataImageTelkom.buffer.asUint8List();

    final myFontBold = await PdfGoogleFonts.poppinsBold();
    final myFont = await PdfGoogleFonts.poppinsRegular();

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
              pw.SizedBox(height: kPadding),
              pw.Text(
                'Customer Detail:',
                style: pw.TextStyle(font: myFontBold),
              ),
              pw.SizedBox(height: kPadding / 3),
              customerPDF(),
              pw.SizedBox(height: kPadding),
              pw.Text(
                'Maerial Detail:',
                style: pw.TextStyle(font: myFontBold),
              ),
              pw.SizedBox(height: kPadding / 3),
              ntePDF(),
              pw.SizedBox(height: kPadding),
              // materialPDF(),
              pw.Spacer(),
              signaturePDF(signCus, signTech),
            ],
          );
        },
      ),
    );
    pdfOpen();
  }

  void pdfOpen() async {
    // save
    Uint8List bytes = await pdf.save();

    // buat file kosong di directory

    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/mydocument.pdf');

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
          child: pw.Text('Berita Acara Digital',
              style: pw.TextStyle(font: myFontBold)),
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

  customerPDF() {
    return pw.Column(
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            CustomerLabel(label: 'Date', value: '2/2/2022'),
            CustomerLabel(label: 'Type of Service', value: 'Gangguan'),
          ],
        ),
        pw.SizedBox(height: kPadding / 2),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            CustomerLabel(label: 'Package', value: 'ASTINET'),
            CustomerLabel(label: 'No Order', value: 'IN12345'),
          ],
        ),
        pw.SizedBox(height: kPadding / 2),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            CustomerLabel(label: 'Service ID', value: '4856421-484514'),
            CustomerLabel(label: 'Contact Phone', value: '081320244664'),
          ],
        ),
        pw.SizedBox(height: kPadding / 2),
        CustomerLabel(label: 'Customer Name', value: 'John Doe'),
        pw.SizedBox(height: kPadding / 2),
        Addressabel(
            label: 'Address',
            value: 'Komp. Kota Baru jl. Alamanda No. 10 Cibaduyut'),
        pw.SizedBox(height: 8),
      ],
    );
  }

  ntePDF() {
    return pw.Column(
      children: [
        NTE(
          labelNTE: 'SN ONT / Mac Address',
          oldLabel: 'Old ONT',
          newLabel: 'New ONT',
          newNTE: '4781273812',
          oldNTE: '127837217321',
        ),
        pw.SizedBox(height: 8),
        NTE(
          labelNTE: 'SN STB / Mac Address',
          oldLabel: 'Old STB',
          newLabel: 'New STB',
          newNTE: '-',
          oldNTE: '-',
        ),
        pw.SizedBox(height: 8),
        // NTE(
        //   labelNTE: 'SN SDWAN / Mac Address',
        //   oldLabel: 'Old SDWAN',
        //   newLabel: 'New SDWAN',
        //   newNTE: '-',
        //   oldNTE: '127837217321',
        // ),
      ],
    );
  }

  materialPDF() {}

  signaturePDF(Uint8List signTech, signCus) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        PWSignature(
          dateLabel: '',
          labelName: 'Customer',
          signature: signTech.buffer.asUint8List(),
          name: 'Customer Name',
        ),
        PWSignature(
          dateLabel: '',
          labelName: 'Technician',
          signature: signCus.buffer.asUint8List(),
          name: 'Technician Name',
        ),
      ],
    );
  }
}
