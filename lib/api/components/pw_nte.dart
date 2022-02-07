import 'package:d_bam/constants.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class NTE extends pw.StatelessWidget {
  final String oldNTE, newNTE, labelNTE;

  final myFontBold = PdfGoogleFonts.poppinsBold();
  NTE({
    required this.oldNTE,
    required this.newNTE,
    required this.labelNTE,
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
              width: kPadding,
            ),
            pw.Text('OLD |'),
            pw.SizedBox(width: kPadding / 4),
            pw.Container(
              width: 100,
              child: pw.Center(
                child: pw.Text(
                  oldNTE,
                ),
              ),
            ),
            pw.SizedBox(width: kPadding),
            pw.Icon(
              pw.IconData(0xe5df),
            ),
            pw.SizedBox(width: kPadding),
            pw.Text('NEW |'),
            pw.SizedBox(width: kPadding / 4),
            pw.Container(
              width: 100,
              child: pw.Center(
                child: pw.Text(
                  newNTE,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
