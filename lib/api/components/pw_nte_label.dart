import 'package:d_bam/constants.dart';
import 'package:pdf/widgets.dart' as pw;

class NTELabel extends pw.StatelessWidget {
  final pw.Font? font;

  NTELabel({this.font});
  @override
  pw.Widget build(pw.Context context) {
    return pw.Column(
      children: [
        pw.Row(
          children: [
            pw.Container(
              width: 80,
              child: pw.Text(
                '',
                style: pw.TextStyle(
                  fontSize: 10,
                ),
              ),
            ),
            pw.SizedBox(
              width: kPadding,
            ),
            pw.SizedBox(width: kPadding / 4),
            pw.Container(
              width: 200,
              child: pw.Center(
                child: pw.Text(
                  'OLD',
                  style: pw.TextStyle(
                    fontSize: 10,
                    font: font,
                  ),
                ),
              ),
            ),
            pw.SizedBox(width: kPadding * 2),
            pw.Container(
              width: 200,
              child: pw.Center(
                child: pw.Text(
                  'NEW',
                  style: pw.TextStyle(
                    fontSize: 10,
                    font: font,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
