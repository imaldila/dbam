import 'package:d_bam/models/datepicker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants.dart';

class MyDateForm extends StatelessWidget {
  MyDateForm({Key? key, this.controller, this.formkey}) : super(key: key);

  final TextEditingController? controller;
  final GlobalKey? formkey;

  @override
  Widget build(BuildContext context) {
    return Consumer<DatePicker>(
      builder: (context, datePicker, child) => Padding(
        padding: const EdgeInsets.only(top: kPadding / 2, bottom: kPadding),
        child: Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: InkWell(
            onTap: () {
              datePicker.selectDate(context);
            },
            child: AbsorbPointer(
              child: TextFormField(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return AppLocalizations.of(context)!.valDate;
                  }
                  return null;
                },
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: kPadding * 1.4, horizontal: kPadding * 0.8),
                  enabledBorder: kStyleBorder,
                  border: kStyleBorder,
                  errorBorder: kErrorBorder,
                ),
                // onChanged: onChanged,
                controller: datePicker.dateController,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
