import 'package:flutter/material.dart';

import '../../../constants.dart';

class MyAddressForm extends StatelessWidget {
  MyAddressForm(
      {Key? key,
      this.controller,
      this.formkey,
      this.counterText,
      this.onChanged})
      : super(key: key);

  final TextEditingController? controller;
  final GlobalKey? formkey;
  final String? counterText;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(top: kPadding / 2, bottom: kPadding),
      child: Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter an Address!';
            }
            return null;
          },
          maxLines: 5,
          controller: controller,
          textInputAction: TextInputAction.done,
          textCapitalization: TextCapitalization.words,
          onChanged: onChanged,
          decoration: InputDecoration(
            counterText: counterText,
            enabledBorder: kStyleBorder,
            border: kStyleBorder,
            errorBorder: kErrorBorder,
          ),
        ),
      ),
    );
  }
}
