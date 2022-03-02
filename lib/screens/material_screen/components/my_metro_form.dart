import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../../models/text_data.dart';

class MyMetroForm extends StatefulWidget {
  const MyMetroForm({
    Key? key,
  }) : super(key: key);

  @override
  State<MyMetroForm> createState() => _MyMetroFormState();
}

class _MyMetroFormState extends State<MyMetroForm> {
  final metroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final myDatekProvider = context.read<TextData>();
    return TextField(
      style: kTextStyle14,
      controller: metroController,
      onChanged: myDatekProvider.getMetro,
      textInputAction: TextInputAction.done,
      textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.characters,
      decoration: InputDecoration(
          hintText: 'METRO ex : ME3-D3-LBG 1/2/3',
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
          border: UnderlineInputBorder(),
          counterText: ''),
    );
  }
}
