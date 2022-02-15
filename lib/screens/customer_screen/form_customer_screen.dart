import 'package:d_bam/constants.dart';
import 'package:d_bam/models/choose_data.dart';
import 'package:d_bam/models/text_data.dart';

import 'package:d_bam/screens/material_screen/form_material_screen.dart';

import 'package:d_bam/widgets/my_button_rounded.dart';

import 'package:d_bam/widgets/my_text_form.dart';
import 'package:d_bam/widgets/my_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import 'components/my_address_form.dart';
import 'components/my_date_form.dart';
import 'components/my_dropdown_list.dart';

class FormCustomer extends StatefulWidget {
  FormCustomer({Key? key}) : super(key: key);

  @override
  _FormCustomerState createState() => _FormCustomerState();
}

class _FormCustomerState extends State<FormCustomer> {
  final dateController = TextEditingController();
  final orderController = TextEditingController();
  final serviceController = TextEditingController();
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();
  final technicianController = TextEditingController();
  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
  ];

  final ChooseData chooseData = ChooseData();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    dateController.dispose();
    orderController.dispose();
    serviceController.dispose();
    nameController.dispose();
    phoneController.dispose();
    addressController.dispose();
    technicianController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextData myProvider = context.read<TextData>();
    return Scaffold(
      backgroundColor: kBgColour,
      appBar: buildAppBar(context),
      body: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.symmetric(
          vertical: 24,
          horizontal: kHorPadding,
        ),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const MyTextTitle(title: 'Package'),
              MyDropDownList(
                formKey: formKeys[0],
              ),
              const MyTextTitle(title: 'Date'),
              MyDateForm(
                formkey: formKeys[1],
              ),
              const MyTextTitle(title: 'No Order'),
              MyTextForm(
                formkey: formKeys[2],
                controller: orderController,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.characters,
                counterText: 'Ex: SC12345 / IN12345 / 1-1234',
                onChanged: myProvider.getOrder,
                validator: 'Please enter No Order!',
              ),
              const MyTextTitle(title: 'Service ID'),
              MyTextForm(
                formkey: formKeys[3],
                controller: serviceController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                counterText: 'Ex: 0221234 / 13110234 / 456789-8910',
                onChanged: myProvider.getService,
                validator: 'Please enter Service ID!',
              ),
              const MyTextTitle(title: 'Customer Name'),
              MyTextForm(
                formkey: formKeys[4],
                controller: nameController,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                onChanged: myProvider.getName,
                validator: 'Please enter Customer Name!',
              ),
              const MyTextTitle(title: 'Contact Phone'),
              MyTextForm(
                formkey: formKeys[5],
                controller: phoneController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                onChanged: myProvider.getPhone,
                validator: 'Please enter Customer Contact Phone!',
              ),
              const MyTextTitle(title: 'Technician Name / NIK'),
              MyTextForm(
                formkey: formKeys[6],
                controller: technicianController,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                onChanged: context.read<TextData>().getTechName,
                validator: 'Please enter Your Name Please!',
                counterText: 'ex: Dede / 101010',
              ),
              const MyTextTitle(title: 'Address'),
              MyAddressForm(
                  formkey: formKeys[7],
                  controller: addressController,
                  onChanged: myProvider.getAddress),
              const SizedBox(
                height: kPadding,
              ),
              BottonRounded(
                title: 'Next',
                onPressed: () {
                  _sendDataToNextScreen(context);
                },
              ),
            ],
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

  void _sendDataToNextScreen(BuildContext context) async {
    for (int i = 0; i < formKeys.length; i++)
      // ignore: curly_braces_in_flow_control_structures
      if (formKeys[i].currentState!.validate()) {}

    if (formKeys[0].currentState!.validate() &&
        formKeys[1].currentState!.validate() &&
        formKeys[2].currentState!.validate() &&
        formKeys[3].currentState!.validate() &&
        formKeys[4].currentState!.validate() &&
        formKeys[5].currentState!.validate() &&
        formKeys[6].currentState!.validate() &&
        formKeys[7].currentState!.validate()) {
      formKeys[0].currentState!.save();
      formKeys[1].currentState!.save();
      formKeys[2].currentState!.save();
      formKeys[3].currentState!.save();
      formKeys[4].currentState!.save();
      formKeys[4].currentState!.save();
      formKeys[5].currentState!.save();
      formKeys[6].currentState!.save();
      formKeys[7].currentState!.save();

      // await Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => FormMaterial()));

      await Navigator.push(
        context,
        PageTransition(
            child: FormMaterial(), type: PageTransitionType.rightToLeft),
      );
    }
  }
}
