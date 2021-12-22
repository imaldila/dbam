import 'package:flutter/material.dart';

import '../constants.dart';

class MyAddressForm extends StatelessWidget {
  MyAddressForm({Key? key, this.controller, this.formkey, this.counterText})
      : super(key: key);

  final TextEditingController? controller;
  final GlobalKey? formkey;
  final String? counterText;

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
                height: size.height / 7.3,
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
              maxLines: 5,
              controller: controller,
              textInputAction: TextInputAction.done,
              textCapitalization: TextCapitalization.words,
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
