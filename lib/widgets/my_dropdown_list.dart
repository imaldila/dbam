import 'package:d_bam/models/package_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class MyDropDownList extends StatelessWidget {
  MyDropDownList({
    Key? key,
    this.listTitle,
    this.formKey,
  }) : super(key: key);

  final String? listTitle;
  final GlobalKey? formKey;

  @override
  Widget build(BuildContext context) {
    // PackageData packageData = PackageData();
    Size size = MediaQuery.of(context).size;
    return Consumer<PackageData>(
      builder: (context, packageData, child) => Padding(
        padding: const EdgeInsets.only(top: kPadding / 2, bottom: kPadding),
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Stack(
            children: [
              Material(
                elevation: 8,
                borderRadius: BorderRadius.circular(16),
                shadowColor: Colors.white,
                child: Container(
                  alignment: Alignment.center,
                  height: size.height / 14,
                  decoration: kStyleBoxDecoration,
                ),
              ),
              DropdownButtonFormField<String>(
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
                style: kTextStyle14,
                decoration: InputDecoration(
                  enabledBorder: kStyleBorder,
                  border: kStyleBorder,
                ),
                isDense: true,
                value: packageData.selected,
                onChanged: (newValue) {
                  packageData.selected = newValue;
                },
                items: packageData.packages.map<DropdownMenuItem<String>>(
                  (String value) {
                    return DropdownMenuItem<String>(
                      value: value.toString(),
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
            ],
          ),
        ),
      ),
    );
  }
}

              // items: getPackages.map((Package pack) {
              //   return DropdownMenuItem(
              //     child: Text(pack.name.toString()),
              //     value: pack,
              //   );
              // }).toList(),
              // onChanged: (value) {
              //   // setState(() {
              //   //   valueDrop = value.toString();
              //   // });
              //   print('');
              // },