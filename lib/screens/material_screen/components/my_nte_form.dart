import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/widgets/my_text_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '/../constants.dart';

class MyNTEForm extends StatelessWidget {
  MyNTEForm(
      {Key? key,
      this.oldChanged,
      this.newChanged,
      this.formkey,
      this.counterText,
      this.textInputAction,
      this.textCapitalization = TextCapitalization.none,
      this.oldTitle,
      this.newTitle,
      this.oldController,
      this.newController})
      : super(key: key);

  final Function(String)? oldChanged;
  final Function(String)? newChanged;
  final TextEditingController? oldController;
  final TextEditingController? newController;
  final GlobalKey? formkey;
  final String? counterText;
  final TextInputAction? textInputAction;
  final TextCapitalization? textCapitalization;
  final String? oldTitle;
  final String? newTitle;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Consumer<TextData>(
      builder: (context, textData, child) => Padding(
        padding: const EdgeInsets.only(top: kPadding / 2, bottom: kPadding),
        child: Form(
          key: formkey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              MyTextTitle(title: oldTitle!),
              SizedBox(
                height: 8,
              ),
              Stack(
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
                    controller: oldController,
                    onChanged: oldChanged,
                    textCapitalization: TextCapitalization.characters,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      counterText: counterText,
                      enabledBorder: kStyleBorder,
                      border: kStyleBorder,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Icon(Icons.keyboard_arrow_down_rounded),
              // SizedBox(
              //   height: 8,
              // ),
              MyTextTitle(title: newTitle!),
              SizedBox(
                height: 8,
              ),
              Stack(
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
                    controller: newController,
                    onChanged: newChanged,
                    textCapitalization: TextCapitalization.characters,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      counterText: counterText,
                      enabledBorder: kStyleBorder,
                      border: kStyleBorder,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
