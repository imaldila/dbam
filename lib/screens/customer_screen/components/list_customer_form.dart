import 'package:d_bam/models/text_data.dart';
import 'package:d_bam/widgets/my_text_form.dart';
import 'package:d_bam/widgets/my_text_title.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListCustomerForm extends StatelessWidget {
  ListCustomerForm({Key? key}) : super(key: key);

   final orderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<TextData>(builder: (context, textData, child) {
      print('in builder for consumer: ');
      print(textData.order);
      if (orderController.text != textData.order) {
        orderController.text = textData.order;
      } else {
        '';
      }
      return Column(
        children: [
          MyTextTitle(title: 'No Order'),
          MyTextForm(
            // formkey: formKeys[2],
            controller: orderController,
            textInputAction: TextInputAction.next,
            textCapitalization: TextCapitalization.characters,
            counterText: 'Ex: SC12345 / IN12345 / 1-1234',
            onChanged: (value) => textData.getOrder,
            validator: 'Please enter No Order!',
          ),
        ],
      );
    });
  }
}
