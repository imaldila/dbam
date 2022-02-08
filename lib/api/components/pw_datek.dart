import 'package:pdf/widgets.dart' as pw;

import '../../constants.dart';

class PWDatek extends pw.StatelessWidget {
  final pw.Font font;
  final String label, value;

  PWDatek({required this.font, required this.label, required this.value});
  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(
      children: [
        pw.Text(
          label,
          style: pw.TextStyle(
            font: font,
            fontSize: 10,
          ),
        ),
        pw.SizedBox(width: kPadding / 3),
        pw.Text(
          value,
          style: pw.TextStyle(
            font: font,
            fontSize: 10,
          ),
        ),
      ],
    );
  }
}
