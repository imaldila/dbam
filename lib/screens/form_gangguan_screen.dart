import 'package:d_bam/constants.dart';
import 'package:d_bam/models/datepicker.dart';

import 'package:d_bam/models/package_data.dart';
import 'package:d_bam/models/val_key.dart';
import 'package:d_bam/screens/form_material_screen.dart';
import 'package:d_bam/widgets/my_adrdess_form.dart';
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
  final orderController = TextEditingController();
  final serviceController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  @override
  void dispose() {
    orderController.dispose();
    serviceController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer2<PackageData, DatePicker>(
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
                  formKey: ValKey.listKey,
                ),
                MyTextTitle(title: 'Date'),
                MyDateForm(
                  formkey: ValKey.dateKey,
                ),
                MyTextTitle(title: 'No Order'),
                MyTextForm(
                  formkey: ValKey.orderKey,
                  controller: orderController,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.characters,
                  counterText: 'Ex: SC12345 / IN12345 / 1-1234',
                ),
                MyTextTitle(title: 'Service ID'),
                MyTextForm(
                  formkey: ValKey.serviceKey,
                  controller: serviceController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                  counterText: 'Ex: 0221234 / 13110234 / 456789-8910',
                ),
                MyTextTitle(title: 'Customer Name'),
                MyTextForm(
                  formkey: ValKey.nameKey,
                  controller: nameController,
                  textInputAction: TextInputAction.next,
                  textCapitalization: TextCapitalization.words,
                ),
                MyTextTitle(title: 'Contact Phone'),
                MyTextForm(
                  formkey: ValKey.phoneKey,
                  controller: phoneController,
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.number,
                ),
                MyTextTitle(title: 'Address'),
                MyAddressForm(
                  formkey: ValKey.addressKey,
                  controller: addressController,
                ),
                const SizedBox(
                  height: kPadding,
                ),
                BottonRounded(
                  title: 'Next',
                  onPressed: () {
                    _sendDataToNextScreen(context);

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

  void _sendDataToNextScreen(BuildContext context) {
    if (ValKey.listKey.currentState!.validate() &&
        ValKey.dateKey.currentState!.validate() &&
        ValKey.orderKey.currentState!.validate() &&
        ValKey.serviceKey.currentState!.validate() &&
        ValKey.nameKey.currentState!.validate() &&
        ValKey.phoneKey.currentState!.validate() &&
        ValKey.addressKey.currentState!.validate()) {
      ValKey.listKey.currentState!.save();
      ValKey.dateKey.currentState!.save();
      ValKey.orderKey.currentState!.save();
      ValKey.serviceKey.currentState!.save();
      ValKey.nameKey.currentState!.save();
      ValKey.phoneKey.currentState!.save();
      ValKey.addressKey.currentState!.save();
      Navigator.push(
        context,
        PageTransition(
            child: FormMaterial(), type: PageTransitionType.rightToLeft),
      );
    }
  }
}
