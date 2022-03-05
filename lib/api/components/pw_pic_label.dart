import 'package:d_bam/constants.dart';
import 'package:pdf/widgets.dart' as pw;

class PICLabel extends pw.StatelessWidget {
  final String label, value;

  PICLabel({required this.label, required this.value});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(
      children: [
        pw.Container(
          width: 110,
          child: pw.Text(
            label,
            style: pw.TextStyle(
              fontSize: 10,
            ),
          ),
        ),
        pw.Text(
          ' : ',
        ),
        pw.SizedBox(
          width: kPadding / 2,
        ),
        pw.Container(
          width: 280,
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
