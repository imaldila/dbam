import 'package:d_bam/constants.dart';
import 'package:d_bam/models/choose_data.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/screens/customer_screen/components/my_choices.dart';
import 'package:d_bam/screens/material_screen/form_material_screen.dart';
import 'package:d_bam/widgets/my_button_rounded.dart';
import 'package:d_bam/widgets/my_text_form.dart';
import 'package:d_bam/widgets/my_text_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
  final picControlller = TextEditingController();
  final addressController = TextEditingController();
  final technicianController = TextEditingController();
  final nikController = TextEditingController();

  List<GlobalKey<FormState>> formKeys = [
    GlobalKey<FormState>(),
    GlobalKey<FormState>(),
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
  final TextData textData = TextData();

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
    picControlller.dispose();
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
              MyTextTitle(title: AppLocalizations.of(context)!.titleChoose),
              MyChoices(),
              MyTextTitle(title: AppLocalizations.of(context)!.package),
              MyDropDownList(
                formKey: formKeys[0],
              ),
              MyTextTitle(title: AppLocalizations.of(context)!.date),
              MyDateForm(
                formkey: formKeys[1],
              ),
              MyTextTitle(title: AppLocalizations.of(context)!.noOrder),
              MyTextForm(
                formkey: formKeys[2],
                controller: orderController,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.characters,
                counterText: 'Ex: SC12345 / IN12345 / 1-1234',
                maxLength: 14,
                onChanged: myProvider.getOrder,
                validator: AppLocalizations.of(context)!.valOrder,
              ),
              MyTextTitle(title: AppLocalizations.of(context)!.serviceID),
              MyTextForm(
                formkey: formKeys[3],
                controller: serviceController,
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                counterText: 'Ex: 0221234 / 13110234 / 456789-8910',
                maxLength: 25,
                onChanged: myProvider.getService,
                validator: AppLocalizations.of(context)!.valServiceID,
              ),
              MyTextTitle(title: AppLocalizations.of(context)!.customerName),
              MyTextForm(
                formkey: formKeys[4],
                controller: nameController,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.words,
                onChanged: myProvider.getName,
                validator: AppLocalizations.of(context)!.valCustomerName,
                counterText: 'ex: PT Dede / Dedea',
                maxLength: 25,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextTitle(
                            title: AppLocalizations.of(context)!.picName),
                        MyTextForm(
                          formkey: formKeys[5],
                          controller: picControlller,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          onChanged: myProvider.getPIC,
                          validator: AppLocalizations.of(context)!.valPIC,
                          counterText: 'ex: Dede',
                          maxLength: 15,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: kPadding,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextTitle(
                            title: AppLocalizations.of(context)!.contactPhone),
                        MyTextForm(
                          maxLength: 16,
                          formkey: formKeys[6],
                          controller: phoneController,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          onChanged: myProvider.getPhone,
                          validator:
                              AppLocalizations.of(context)!.valContactPhone,
                          counterText: 'Ex: 08123456789',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextTitle(
                            title:
                                AppLocalizations.of(context)!.technicianName),
                        MyTextForm(
                          formkey: formKeys[7],
                          controller: technicianController,
                          textInputAction: TextInputAction.next,
                          textCapitalization: TextCapitalization.words,
                          onChanged: myProvider.getTechName,
                          validator:
                              AppLocalizations.of(context)!.valTechnicianName,
                          // counterText: 'ex: Dede',
                          maxLength: 15,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: kPadding,
                  ),
                  Expanded(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        MyTextTitle(title: 'NIK'),
                        MyTextForm(
                          formkey: formKeys[8],
                          maxLength: 8,
                          controller: nikController,
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          // textCapitalization: TextCapitalization.words,
                          onChanged: myProvider.getNIK,
                          validator: AppLocalizations.of(context)!.valNIK,
                          counterText: '',
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              MyTextTitle(title: AppLocalizations.of(context)!.address),
              MyAddressForm(
                  formkey: formKeys[9],
                  controller: addressController,
                  onChanged: myProvider.getAddress),
              const SizedBox(
                height: kPadding,
              ),
              BottonRounded(
                title: AppLocalizations.of(context)!.buttonNext,
                onPressed: () {
                  _sendDataToNextScreen(context);
                  // print(context.read<ChooseData>().selected == 'Provisioning' ? 'Pasang Baru' : 'Gangguan');
                  // print('tap');
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
        AppLocalizations.of(context)!.titleCustomer,
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
        formKeys[7].currentState!.validate() &&
        formKeys[8].currentState!.validate() &&
        formKeys[9].currentState!.validate()) {
      formKeys[0].currentState!.save();
      formKeys[1].currentState!.save();
      formKeys[2].currentState!.save();
      formKeys[3].currentState!.save();
      formKeys[4].currentState!.save();
      formKeys[4].currentState!.save();
      formKeys[5].currentState!.save();
      formKeys[6].currentState!.save();
      formKeys[7].currentState!.save();
      formKeys[8].currentState!.save();
      formKeys[9].currentState!.save();

      // await Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => FormMaterial()));
      if (context.read<ChooseData>().selected.isEmpty) {
        await showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text(
              AppLocalizations.of(context)!.titleChoose,
              style: kTextStyle16Bold,
            ),
            content: Text(
              'Provisioning / Assurance',
              style: kTextStyle14Bold,
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, 'OK'),
                child: const Text('OK'),
              ),
            ],
          ),
        );
      } else {
        await Navigator.push(
          context,
          PageTransition(
              child: FormMaterial(), type: PageTransitionType.rightToLeft),
        );
      }
    }
  }
}
