import 'dart:io';

import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:printing/printing.dart';

import 'package:pdf/widgets.dart' as pw;
import 'package:pdf/pdf.dart';
import 'package:flutter/services.dart' show rootBundle;

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
            icons: await PdfGoogleFonts.materialIcons(), base: myFont),
        margin: pw.EdgeInsets.fromLTRB(36, 16, 36, 36),
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return pw.Column(
            children: [
              headerPDF(myImageTA, myImageTelkom, myFontBold),
              pw.Divider(),
              pw.SizedBox(height: 16),
              pw.Text(
                'Customer Detail:',
                style: pw.TextStyle(font: myFontBold),
              ),
              pw.SizedBox(height: 16),
              customerPDF(),
              pw.SizedBox(height: 16),
              pw.Text(
                'Maerial Detail:',
                style: pw.TextStyle(font: myFontBold),
              ),
              pw.SizedBox(height: 16),
              materialPDF(),
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
          children: [
            pw.Container(
              width: 160,
              child: pw.Text(
                'Jenis Layanan',
              ),
            ),
            pw.Text(
              ' : ',
            ),
            pw.SizedBox(
              width: 16,
            ),
            pw.Text(
              'Gangguan',
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Row(
          children: [
            pw.Container(
              width: 160,
              child: pw.Text(
                'Package',
              ),
            ),
            pw.Text(
              ' : ',
            ),
            pw.SizedBox(
              width: 16,
            ),
            pw.Text(
              'ASTINET',
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Row(
          children: [
            pw.Container(
              width: 160,
              child: pw.Text(
                'Date',
              ),
            ),
            pw.Text(
              ' : ',
            ),
            pw.SizedBox(
              width: 16,
            ),
            pw.Text(
              '31/1/21',
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Row(
          children: [
            pw.Container(
              width: 160,
              child: pw.Text(
                'No Order',
              ),
            ),
            pw.Text(
              ' : ',
            ),
            pw.SizedBox(
              width: 16,
            ),
            pw.Text(
              'IN12345',
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Row(
          children: [
            pw.Container(
              width: 160,
              child: pw.Text(
                'Service ID',
              ),
            ),
            pw.Text(
              ' : ',
            ),
            pw.SizedBox(
              width: 16,
            ),
            pw.Text(
              '1-12345',
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Row(
          children: [
            pw.Container(
              width: 160,
              child: pw.Text(
                'Customer Name',
              ),
            ),
            pw.Text(
              ' : ',
            ),
            pw.SizedBox(
              width: 16,
            ),
            pw.Text(
              'Test Name',
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Row(
          children: [
            pw.Container(
              width: 160,
              child: pw.Text(
                'Contact Phone',
              ),
            ),
            pw.Text(
              ' : ',
            ),
            pw.SizedBox(
              width: 16,
            ),
            pw.Text(
              '081231212',
            ),
          ],
        ),
        pw.SizedBox(height: 8),
        pw.Row(
          children: [
            pw.Container(
              width: 160,
              child: pw.Text(
                'Address',
              ),
            ),
            pw.Text(
              ' : ',
            ),
            pw.SizedBox(
              width: 16,
            ),
            pw.Text(
              'Jl. Lembong No . 11 - 14',
            ),
          ],
        ),
      ],
    );
  }

  signaturePDF(Uint8List signTech, signCus) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        pw.Column(
          mainAxisAlignment: pw.MainAxisAlignment.center,
          children: [
            pw.Text(''),
            pw.Text('Customer'),
            pw.Container(
              height: 155,
              width: 200,
              child: pw.Image(
                pw.MemoryImage(
                  signTech.buffer.asUint8List(),
                ),
              ),
            ),
            pw.Text('Customer Name')
          ],
        ),
        pw.Column(
          children: [
            pw.Text('Bandung, 2 February 2022'),
            pw.SizedBox(height: 6),
            pw.Text('Technician'),
            pw.Container(
              height: 150,
              width: 200,
              child: pw.Image(
                pw.MemoryImage(
                  signCus.buffer.asUint8List(),
                ),
              ),
            ),
            pw.Text('Technician Name')
          ],
        ),
      ],
    );
  }

  materialPDF() {
    return pw.Column(
      children: [
        NTE(
            labelNTE: 'SN ONT / Mac Address',
            oldLabel: 'Old ONT',
            newLabel: 'New ONT',
            newNTE: '4781273812',
            oldNTE: '127837217321'),
      ],
    );
  }
}

class NTE extends pw.StatelessWidget {
  final String oldNTE, newNTE, labelNTE, oldLabel, newLabel;

  NTE({
    required this.oldNTE,
    required this.newNTE,
    required this.labelNTE,
    required this.oldLabel,
    required this.newLabel,
  });
  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      children: [
        pw.Row(
          children: [
            pw.Container(
              width: 160,
              child: pw.Text(
                labelNTE,
              ),
            ),
            pw.Text(
              ' : ',
            ),
            pw.SizedBox(
              width: 16,
            ),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  oldLabel,
                ),
                pw.SizedBox(height: 8),
                pw.Text(
                  oldNTE,
                ),
              ],
            ),
            pw.SizedBox(width: 16),
            pw.Icon(
              pw.IconData(0xe79e),
            ),
            pw.SizedBox(width: 16),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              children: [
                pw.Text(
                  newLabel,
                ),
                pw.SizedBox(height: 8),
                pw.Text(
                  newNTE,
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
