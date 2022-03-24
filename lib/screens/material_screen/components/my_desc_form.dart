import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants.dart';
import '../../../models/text_data.dart';

class MyDescForm extends StatefulWidget {
  const MyDescForm({
    Key? key,
  }) : super(key: key);

  @override
  State<MyDescForm> createState() => _MyDescFormState();
}

class _MyDescFormState extends State<MyDescForm> {
  final metroController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final myDatekProvider = context.read<TextData>();
    return TextField(
      style: kTextStyle14,
      controller: metroController,
      onChanged: myDatekProvider.getDescription,
      textInputAction: TextInputAction.done,
      // textAlign: TextAlign.center,
      textCapitalization: TextCapitalization.words,
      decoration: InputDecoration(
          hintText:  AppLocalizations.of(context)!.desc,
          enabledBorder: UnderlineInputBorder(borderSide: BorderSide()),
          border: UnderlineInputBorder(),
          counterText: ''),
    );
  }
}
