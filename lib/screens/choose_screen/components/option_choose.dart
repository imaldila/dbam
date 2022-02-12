import 'package:d_bam/models/choose_data.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/screens/signature_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../customer_screen/form_customer_screen.dart';
import 'choose_card.dart';

class OptionChoose extends StatelessWidget {
  const OptionChoose({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<ChooseData>(
      builder: (context, data, child) => SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: List.generate(
            data.chooseCount,
            (index) {
              final dataChoose = data.chooseDatas[index];
              return Padding(
                padding: EdgeInsets.all(kPadding),
                child: ChooseCard(
                  svgPicture: SvgPicture.asset(dataChoose.images),
                  label: dataChoose.label,
                  onTap: () {
                    print(context.read<ChooseData>().selected == 'gangguan'
                        ? context.read<TextData>().psb
                        : context.read<TextData>().gangguan);
                    dataChoose.label == 'Provisioning'
                        ? toPSB(context)
                        : toGangguan(context);
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void toGangguan(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => SignatureScreen()));
    // Navigator.push(
    //   context,
    //   PageTransition(
    //       child: FormCustomer(), type: PageTransitionType.rightToLeft),
    // );
  }

  void toPSB(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FormCustomer()));
    // Navigator.push(
    //   context,
    //   PageTransition(
    //       child: FormCustomer(), type: PageTransitionType.rightToLeft),
    // );
  }
}
