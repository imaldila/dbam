import 'package:d_bam/models/package_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../constants.dart';

class MyDropDownList extends StatelessWidget {
  MyDropDownList({
    Key? key,
    this.formKey,
  }) : super(key: key);

  final GlobalKey? formKey;

  @override
  Widget build(BuildContext context) {
    return Consumer<PackageData>(
      builder: (context, packageData, child) => Padding(
        padding: const EdgeInsets.only(top: kPadding / 2, bottom: kPadding),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: DropdownButtonFormField<String>(
            elevation: 8,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppLocalizations.of(context)!.valPackage;
              }
              return null;
            },
            style: kTextStyle14,
            decoration: InputDecoration(
              errorBorder: kErrorBorder,
              enabledBorder: kStyleBorder,
              border: kStyleBorder,
            ),
            isDense: true,
            value: packageData.selected,
            onChanged: (newValue) {
              packageData.selected = newValue;
            },
            items: packageData.packages.map(
              (value) {
                return DropdownMenuItem(
                  value: value,
                  child: Text(value),
                );
              },
            ).toList(),
            icon: SvgPicture.asset(
              'assets/icons/ic_down.svg',
              color: kIcColour,
              // height: 0.1,
            ),
          ),
        ),
      ),
    );
  }
}
