import 'package:pdf/widgets.dart' as pw;

import '../../constants.dart';

class PWMaterial extends pw.StatelessWidget {
  final String title, value, unit;

  PWMaterial({
    required this.title,
    required this.value,
    required this.unit,
  });

  @override
  pw.Widget build(pw.Context context) {
    return pw.Row(
      children: [
        pw.Container(
          width: 110,
          child: pw.Text(
            title,
          ),
        ),
        pw.Text( 
          ' : ',
        ),
        pw.SizedBox(
          width: kPadding / 2,
        ),
        pw.Container(
            width: 50,
            child: pw.Center(
              child: pw.Text(
                value,
              ),
            )),
        pw.SizedBox(
          width: kPadding / 4,
        ),
        pw.Container(
          width: 50,
          child: pw.Text(
            unit,
          ),
        ),
      ],
    );
  }
}
