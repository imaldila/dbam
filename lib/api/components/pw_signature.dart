import 'dart:typed_data';

import 'package:pdf/widgets.dart' as pw;

class PWSignature extends pw.StatelessWidget {
  final String? dateLabel;
  final Uint8List signature;
  final String name, labelName;

  PWSignature({
    this.dateLabel,
    required this.labelName,
    required this.signature,
    required this.name,
  });

  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      children: [
        pw.Text(
          dateLabel!,
          style: pw.TextStyle(
            fontSize: 10,
          ),
        ),
        pw.SizedBox(height: 6),
        pw.Text(
          labelName,
          style: pw.TextStyle(
            fontSize: 10,
          ),
        ),
        pw.Container(
          height: 150,
          width: 200,
          child: pw.Image(
            pw.MemoryImage(
              signature,
            ),
          ),
        ),
        pw.Text(
          name,
          style: pw.TextStyle(
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
