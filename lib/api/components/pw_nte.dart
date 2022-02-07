import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class NTE extends pw.StatelessWidget {
  final String oldNTE, newNTE, labelNTE, oldLabel, newLabel;

  final myFontBold = PdfGoogleFonts.poppinsBold();
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
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text(
                  oldLabel,
                  style: pw.TextStyle(
                    fontSize: 10,
                    fontWeight: pw.FontWeight.bold,
                  ),
                ),
                pw.SizedBox(height: 8),
                pw.Container(
                  width: 120,
                  child: pw.Text(
                    oldNTE,
                  ),
                ),
              ],
            ),
            pw.SizedBox(width: 16),
            pw.Icon(
              pw.IconData(0xeac9),
            ),
            pw.SizedBox(width: 16),
            pw.Column(
              crossAxisAlignment: pw.CrossAxisAlignment.start,
              mainAxisAlignment: pw.MainAxisAlignment.center,
              children: [
                pw.Text(
                  newLabel,
                  style: pw.TextStyle(
                      fontSize: 10, fontWeight: pw.FontWeight.bold),
                ),
                pw.SizedBox(height: 8),
                pw.Container(
                  width: 120,
                  child: pw.Text(
                    newNTE,
                  ),
                ),
              ],
            ),
          ],
        )
      ],
    );
  }
}
