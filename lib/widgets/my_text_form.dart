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
      this.textCapitalization = TextCapitalization.none})
      : super(key: key);

  final Function(String)? onChanged;
  final TextEditingController? controller;
  final GlobalKey? formkey;
  final String? counterText;
  final TextInputAction? textInputAction;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
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
                  return 'Please enter some text';
                }
                return null;
              },
              controller: controller,
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
    );
  }
}
