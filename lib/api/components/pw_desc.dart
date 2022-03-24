import 'package:d_bam/constants.dart';
import 'package:pdf/widgets.dart' as pw;

class DescLabel extends pw.StatelessWidget {
  final String label, value;
  final pw.Font? font;

  DescLabel({this.font, required this.label, required this.value});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(
      children: [
        pw.Container(
          width: 110,
          child: pw.Text(
            label,
            style: pw.TextStyle(fontSize: 10, font: font),
          ),
        ),
        pw.Text(
          ' : ',
        ),
        pw.SizedBox(
          width: kPadding / 2,
        ),
        pw.Container(
          width: 360,
          child: pw.Text(
            value,
            style: pw.TextStyle(
              fontSize: 10,
            ),
          ),
        ),
      ],
    );
  }
}
