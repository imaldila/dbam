import 'package:d_bam/models/text_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
      this.textCapitalization = TextCapitalization.none, this.validator})
      : super(key: key);

  final Function(String)? onChanged;
  final TextEditingController? controller;
  final GlobalKey? formkey;
  final String? counterText, validator;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<TextData>(
      builder: (context, textData, child) => Padding(
        padding: const EdgeInsets.only(top: kPadding / 2, bottom: kPadding),
        child: Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Stack(
            children: [
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(16),
                shadowColor: Colors.white,
                child: Container(
                  height: size.height / 15.5,
                  decoration: kStyleBoxDecoration,
                ),
              ),
              TextFormField(
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
                decoration: InputDecoration(
                  counterText: counterText,
                  enabledBorder: kStyleBorder,
                  border: kStyleBorder,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
