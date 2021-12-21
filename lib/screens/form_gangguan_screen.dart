import 'package:d_bam/constants.dart';
import 'package:d_bam/models/my_datepicker.dart';
import 'package:d_bam/models/package.dart';
import 'package:d_bam/models/package_data.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:d_bam/widgets/my_date_form.dart';
import 'package:d_bam/widgets/my_dropdown_list.dart';
import 'package:d_bam/widgets/my_text_form.dart';
import 'package:d_bam/widgets/my_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class FormGangguan extends StatefulWidget {
  FormGangguan({Key? key}) : super(key: key);

  static const String id = 'Formg Gangguan';

  @override
  _FormGangguanState createState() => _FormGangguanState();
}

class _FormGangguanState extends State<FormGangguan> {
  final packageController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _listKey = GlobalKey<FormState>();

  @override
  void dispose() {
    packageController.dispose();
    PackageData;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<PackageData, MyDatePicker>(
      builder: (context, packageData, datePicker, child) => Scaffold(
        backgroundColor: kBgColour,
        appBar: buildAppBar(context),
        body: ListView(
          padding: EdgeInsets.symmetric(
            vertical: 24,
            horizontal: kHorPadding,
          ),
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextTitle(title: 'Package'),
                MyDropDownList(
                  formKey: _listKey,
                ),
                MyTextTitle(title: 'Date'),
                MyDateForm(),
                MyTextTitle(title: 'SC / Ticket / AO'),
                MyTextForm(
                  controller: packageController,
                  counterText: 'Ex: SC12345 / IN12345 / 1-1234',
                ),
                MyTextTitle(title: 'Inet / Tlp / SID'),
                MyTextForm(
                  controller: packageController,
                ),
                MyTextTitle(title: 'Customer Name'),
                MyTextForm(
                  controller: packageController,
                ),
                MyTextTitle(title: 'Customer Phone'),
                MyTextForm(
                  controller: packageController,
                ),
                MyTextTitle(title: 'Address'),
                MyTextForm(
                  controller: packageController,
                ),
                const SizedBox(
                  height: kPadding,
                ),
                BottonRounded(
                  title: 'Next',
                  onPressed: () {
                    // _formKey.currentState!.validate()
                    //     ? print(packageController.text)
                    //     : print('Error');
                    // _listKey.currentState!.validate()
                    //     ? print(packageData.selected)
                    //     : print('Error');

                        print(datePicker.selected);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      toolbarHeight: 64,
      backgroundColor: kBgColour,
      leading: Padding(
        padding: const EdgeInsets.all(8),
        child: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset(
            'assets/icons/ic_left.svg',
            color: kIcColour,
          ),
        ),
      ),
      centerTitle: true,
      title: Text(
        'Customer Form',
        style: kTextStyle20Bold,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kHorPadding),
          child: CircleAvatar(
            foregroundColor: Colors.red,
            backgroundColor: kBgColour,
            child: Image.asset(
              'assets/images/logo1.png',
              fit: BoxFit.contain,
            ),
            radius: 24,
          ),
        ),
      ],
      shadowColor: kBgColour,
    );
  }
}
