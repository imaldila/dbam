import 'package:d_bam/models/package.dart';
import 'package:d_bam/models/package_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../constants.dart';

class MyDropDownList extends StatelessWidget {
  MyDropDownList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PackageData packageData = PackageData();
    Size size = MediaQuery.of(context).size;
    return  Padding(
              padding:
                  const EdgeInsets.only(top: kPadding / 2, bottom: kPadding),
              child: Stack(
                children: [
                  Material(
                    elevation: 8,
                    borderRadius: BorderRadius.circular(16),
                    shadowColor: Colors.white,
                    child: Container(
                      alignment: Alignment.center,
                      height: size.height / 15.5,
                      decoration: kStyleBoxDecoration,
                    ),
                  ),
                  DropdownButtonFormField(
                    style: TextStyle(height: 0.5, color: Colors.black),
                    decoration: InputDecoration(
                      enabledBorder: kStyleBorder,
                      border: kStyleBorder,
                    ),
                    isDense: true,
                    items: getPackages.map((Package pack) {
                      return DropdownMenuItem(
                        child: Text(pack.name.toString()),
                        value: pack,
                      );
                    }).toList(),
                    onChanged: (value) {
                      // setState(() {
                      //   valueDrop = value.toString();
                      // });
                      print(value);
                    },
                    icon: SvgPicture.asset(
                      'assets/icons/ic_down.svg',
                      color: kIcColour,
                      // height: 0.1,
                    ),
                  ),
                ],
              ),
            );
          
    
  }
}
