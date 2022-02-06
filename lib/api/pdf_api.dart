import 'dart:io';

import 'dart:typed_data';

import 'package:d_bam/models/text_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
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

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            children: [
              pw.Text('Hellow Wolrds'),
              pw.Image(pw.MemoryImage(
                signTech.buffer.asUint8List(),
              )),
              pw.Image(
                pw.MemoryImage(
                  signCus.buffer.asUint8List(),
                ),
              ),
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
}
