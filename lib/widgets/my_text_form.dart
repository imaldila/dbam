import 'package:flutter/material.dart';

import '../constants.dart';

class MyTextForm extends StatelessWidget {
  MyTextForm(
      {Key? key,
      this.onChanged,
      this.controller,
      this.formkey,
      this.counterText,
      this.textInputAction,
      this.keyboardType,
      this.textCapitalization = TextCapitalization.none,
      this.validator, this.maxLength})
      : super(key: key);

  final Function(String)? onChanged;
  final TextEditingController? controller;
  final GlobalKey? formkey;
  final String? counterText, validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: kPadding / 2, bottom: kPadding),
      child: Form(
        key: formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: TextFormField(
          validator: (value) {
            if (value == null || value.isEmpty) {
              return validator;
            }
            return null;
          },
          controller: controller,
          onChanged: onChanged,
          textCapitalization: textCapitalization!,
          textInputAction: textInputAction,
          keyboardType: keyboardType,
          maxLength: maxLength,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(
              vertical: kPadding * 1.4,
              horizontal: kPadding * 0.8
            ),
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
