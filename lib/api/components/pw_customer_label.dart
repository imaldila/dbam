import 'package:d_bam/constants.dart';
import 'package:pdf/widgets.dart' as pw;

class CustomerLabel extends pw.StatelessWidget {
  final String label, value;

  CustomerLabel({required this.label, required this.value});

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(
      children: [
        pw.Container(
          width: 140,
          child: pw.Text(
            label,
          ),
        ),
        pw.Text(
          ' : ',
        ),
        pw.SizedBox(
          width: kPadding / 2,
        ),
        pw.Container(
          width: 110,
          child: pw.Text(
            value,
          ),
        ),
      ],
    );
  }
}
