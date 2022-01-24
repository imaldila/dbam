import 'package:d_bam/constants.dart';
import 'package:d_bam/models/datepicker.dart';
import 'package:d_bam/models/package_data.dart';
import 'package:d_bam/models/text_data.dart';

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

  @override
  _FormGangguanState createState() => _FormGangguanState();
}

class _FormGangguanState extends State<FormGangguan> {
  final dateController = TextEditingController();
  final orderController = TextEditingController();
  final serviceController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  final ValKey valKey = ValKey();

  final _formKeyGangguanScreen = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  // void closeListerner() {
  //   context.read<DatePicker>().close
  // }

  @override
  void dispose() {
    dateController.dispose();
    orderController.dispose();
    serviceController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();

    // ValKey.listKey.currentState!.dispose();
    // ValKey.dateKey.currentState!.dispose();
    // ValKey.orderKey.currentState!.dispose();
    // ValKey.serviceKey.currentState!.dispose();
    // ValKey.nameKey.currentState!.dispose();
    // ValKey.phoneKey.currentState!.dispose();
    // ValKey.addressKey.currentState!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextData myProvider = context.read<TextData>();

    return Scaffold(
      backgroundColor: kBgColour,
      appBar: buildAppBar(context),
      body: ListView(
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: kHorPadding,
        ),
        children: [
          Form(
            key: _formKeyGangguanScreen,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MyTextTitle(title: 'Package'),
                MyDropDownList(
                  formKey: valKey.listKey,
                ),
                MyTextTitle(title: 'Date'),
                MyDateForm(
                  formkey: valKey.dateKey,
                ),
                MyTextTitle(title: 'No Order'),
                MyTextForm(
                    formkey: valKey.orderKey,
                    controller: orderController,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.characters,
                    counterText: 'Ex: SC12345 / IN12345 / 1-1234',
                    onChanged: myProvider.getOrder),
                MyTextTitle(title: 'Service ID'),
                MyTextForm(
                    formkey: valKey.serviceKey,
                    controller: serviceController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    counterText: 'Ex: 0221234 / 13110234 / 456789-8910',
                    onChanged: myProvider.getService),
                MyTextTitle(title: 'Customer Name'),
                MyTextForm(
                    formkey: valKey.nameKey,
                    controller: nameController,
                    textInputAction: TextInputAction.next,
                    textCapitalization: TextCapitalization.words,
                    onChanged: myProvider.getName),
                MyTextTitle(title: 'Contact Phone'),
                MyTextForm(
                    formkey: valKey.phoneKey,
                    controller: phoneController,
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.number,
                    onChanged: myProvider.getPhone),
                MyTextTitle(title: 'Address'),
                MyAddressForm(
                    formkey: valKey.addressKey,
                    controller: addressController,
                    onChanged: myProvider.getAddress),
                const SizedBox(
                  height: kPadding,
                ),
                BottonRounded(
                  title: 'Next',
                  onPressed: () {
                    _sendDataToNextScreen(context);

                    print(context.read<TextData>().gangguan);
                    print(context.read<PackageData>().selected);
                    print(context.read<DatePicker>().selected);
                    print(context.read<TextData>().order);
                    print(context.read<TextData>().service);
                    print(context.read<TextData>().name);
                    print(context.read<TextData>().phone);
                    print(context.read<TextData>().address);
                  },
                ),
              ],
            ),
          ),
        ],
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
    if (valKey.listKey.currentState!.validate() &&
        valKey.dateKey.currentState!.validate() &&
        valKey.orderKey.currentState!.validate() &&
        valKey.serviceKey.currentState!.validate() &&
        valKey.nameKey.currentState!.validate() &&
        valKey.phoneKey.currentState!.validate() &&
        valKey.addressKey.currentState!.validate()) {
      valKey.listKey.currentState!.save();
      valKey.dateKey.currentState!.save();
      valKey.orderKey.currentState!.save();
      valKey.serviceKey.currentState!.save();
      valKey.nameKey.currentState!.save();
      valKey.phoneKey.currentState!.save();
      valKey.addressKey.currentState!.save();

      Navigator.push(
        context,
        PageTransition(
            child: FormMaterial(), type: PageTransitionType.rightToLeft),
      );
    }
  }
}
