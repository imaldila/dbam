import 'package:d_bam/models/my_datepicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class MyDateForm extends StatelessWidget {
  MyDateForm({Key? key, this.controller, this.formkey}) : super(key: key);

  final TextEditingController? controller;
  final GlobalKey? formkey;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<MyDatePicker>(
      builder: (context, datePicker, child) => Padding(
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
              InkWell(
                onTap: () {
                  datePicker.selectDate(context);
                },
                child: AbsorbPointer(
                  child: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      enabledBorder: kStyleBorder,
                      border: kStyleBorder,
                    ),
                    // onChanged: onChanged,
                    controller: datePicker.dateController,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
