import 'dart:io';

import 'dart:typed_data';
import 'package:d_bam/api/components/pw_address_label.dart';
import 'package:d_bam/api/components/pw_datek.dart';
import 'package:d_bam/api/components/pw_material.dart';
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

  getPDF(
      {required Uint8List signCus,
      required Uint8List signTech,
      required String date,
      typeOS,
      package,
      noOrder,
      serviceID,
      contactPhone,
      customerName,
      address}) async {
    var dataImageTA = await rootBundle.load('assets/images/logo_ta.png');
    var myImageTA = dataImageTA.buffer.asUint8List();

    var dataImageTelkom =
        await rootBundle.load('assets/images/logo_telkom.png');
    var myImageTelkom = dataImageTelkom.buffer.asUint8List();

    final myFontBold = await PdfGoogleFonts.poppinsBold();
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
              pw.Text(
                'Customer Detail:',
                style: pw.TextStyle(font: myFontBold, fontSize: 14),
              ),
              pw.SizedBox(height: kPadding / 3),
              customerPDF(date, package),
              pw.SizedBox(height: kPadding / 1.5),
              pw.Text(
                'Datek:',
                style: pw.TextStyle(font: myFontBold, fontSize: 14),
              ),
              pw.SizedBox(height: kPadding / 3),
              datekPDF(myFontBold),
              pw.SizedBox(height: kPadding / 1.5),
              pw.Text(
                'Material Detail:',
                style: pw.TextStyle(font: myFontBold, fontSize: 14),
              ),
              pw.SizedBox(height: kPadding / 3),
              ntePDF(),
              pw.SizedBox(height: kPadding / 2),
              materialPDF(),
              pw.SizedBox(height: kPadding),
              disclaimerPDF(myFontItalic),
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
              style: pw.TextStyle(font: myFontBold, fontSize: 16)),
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

  customerPDF(String date, package) {
    return pw.Column(
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            CustomerLabel(label: 'Date', value: date),
            CustomerLabel(label: 'Type of Service', value: 'Gangguan'),
          ],
        ),
        pw.SizedBox(height: kPadding / 2),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            CustomerLabel(label: 'Package', value: package),
            CustomerLabel(label: 'No Order', value: 'IN123454567'),
          ],
        ),
        pw.SizedBox(height: kPadding / 2),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            CustomerLabel(label: 'Service ID', value: '4856421-484514a12312'),
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

  datekPDF(pw.Font myFontBold) {
    return pw.Row(
      children: [
        PWDatek(font: myFontBold, label: 'STO :', value: 'TRG'),
        pw.SizedBox(width: kPadding),
        PWDatek(font: myFontBold, label: 'ODC :', value: 'FBA'),
        pw.SizedBox(width: kPadding),
        PWDatek(font: myFontBold, label: 'ODP :', value: '18'),
        pw.SizedBox(width: kPadding),
        PWDatek(font: myFontBold, label: 'Port : ', value: '2'),
      ],
    );
  }

  ntePDF() {
    return pw.Column(
      children: [
        NTE(
          labelNTE: 'SN ONT / Mac Address',
          newNTE: '4781273812',
          oldNTE: '127837217321',
        ),

        NTE(
          labelNTE: 'SN STB / Mac Address',
          newNTE: '-',
          oldNTE: '-',
        ),
        pw.SizedBox(height: kPadding / 2),
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

  materialPDF() {
    return pw.Column(
      children: [
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            PWMaterial(title: 'Dropcore', value: '50', unit: 'Meter'),
            PWMaterial(title: 'Precon 50', value: '1', unit: 'Pcs'),
          ],
        ),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            PWMaterial(title: 'Precon 80', value: '1', unit: 'Pcs'),
            PWMaterial(title: 'RJ 45', value: '1', unit: 'Pcs'),
          ],
        ),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            PWMaterial(title: 'S-Clamp', value: '1', unit: 'Pcs'),
            PWMaterial(title: 'Clamp Hook', value: '1', unit: 'Pcs'),
          ],
        ),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            PWMaterial(title: 'Roset', value: '1', unit: 'Pcs'),
            PWMaterial(title: 'SOC', value: '3', unit: 'Pcs'),
          ],
        ),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
          children: [
            PWMaterial(title: 'Tray Cable', value: '10', unit: 'Pcs'),
            PWMaterial(title: 'Patchcore', value: '1', unit: 'Pcs'),
          ],
        ),
        PWMaterial(title: 'Cable UTP', value: '1', unit: 'Pcs'),
      ],
    );
  }

  disclaimerPDF(pw.Font myFontItalic) {
    return pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text('Disclaimer:', style: pw.TextStyle(font: myFontItalic)),
        pw.Text(
          '1. Perangkat (ONT/Modem/STB) yang dipasang di rumah pelanggan adalah MILIK TELKOM yang dipinjamkan selama menjadi pelanggan TELKOM. Modem yang tidak dipakai karena Migrasi ke Fiber ditarik kembali.',
          style: pw.TextStyle(fontSize: 8, font: myFontItalic),
          textAlign: pw.TextAlign.justify,
        ),
        pw.SizedBox(height: kPadding / 3),
        pw.Text(
          '2. Telkom dapat mengambil Perangkat bila tidak ada penggunaan selama 3 bulan berturut-turut.',
          style: pw.TextStyle(fontSize: 8, font: myFontItalic),
          textAlign: pw.TextAlign.justify,
        ),
        pw.SizedBox(height: kPadding / 3),
        pw.Text(
          '3. Untuk progress pemilihan dan monitoring diharapkan power Perangkat selalu dalam kondisi hidup(ON)',
          style: pw.TextStyle(fontSize: 8, font: myFontItalic),
          textAlign: pw.TextAlign.justify,
        ),
        pw.SizedBox(height: kPadding / 3),
        pw.Text(
          '4. Disarankan untuk segera merubah password yang ada untuk menjaga agar tidak dipergunakan oleh pihak-pihak yang tidak dikehendaki.',
          style: pw.TextStyle(fontSize: 8, font: myFontItalic),
          textAlign: pw.TextAlign.justify,
        ),
        pw.SizedBox(height: kPadding / 3),
        pw.Text(
          '5. Pelanggan sudah mendapatkan penjelasan dari sales/setter atau menerima buku petunjuk menggunakan modem internet yang telah dipasang.',
          style: pw.TextStyle(fontSize: 8, font: myFontItalic),
          textAlign: pw.TextAlign.justify,
        ),
        pw.SizedBox(height: kPadding / 3),
      ],
    );
  }

  signaturePDF(Uint8List signTech, signCus) {
    return pw.Row(
      mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
      children: [
        PWSignature(
          dateLabel: ' ',
          labelName: 'Customer',
          signature: signTech.buffer.asUint8List(),
          name: 'Customer Name',
        ),
        PWSignature(
          dateLabel: '02/02/2022',
          labelName: 'Technician',
          signature: signCus.buffer.asUint8List(),
          name: 'Technician Name',
        ),
      ],
    );
  }
}
