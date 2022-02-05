import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const double kHorPadding = 24.0;
const double kVerPadding = 48.0;
const double kPadding = 16.0;

const kBtnColour = Color(0xFFF20000);
const kDarkColour = Color(0xFF2F2E41);
const kBgColour = Color(0xFFF6F6F6);
const kIcColour = Color(0xFF2E3A59);

final kElevatedBtnStyle = ElevatedButton.styleFrom(
  padding: EdgeInsets.all(kPadding),
  primary: kBtnColour,
  elevation: kPadding,
);

final kBtnTextStyle22 = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w600,
  ),
);

final kTextStyle20 = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 20,
    color: kDarkColour,
  ),
);

final kTextStyle16Bold = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 16,
    color: kDarkColour,
    fontWeight: FontWeight.w600,
  ),
);

final kTextStyle14 = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 14,
    color: kDarkColour,
  ),
);
final kTextStyle14White = GoogleFonts.poppins(
  textStyle: TextStyle(fontSize: 14, color: Colors.white),
);

final kTextStyle24 = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 24,
    color: kDarkColour,
    fontWeight: FontWeight.w800,
  ),
);

final kTextStyle20Bold = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 20,
    color: kDarkColour,
    fontWeight: FontWeight.bold,
  ),
);

OutlineInputBorder kStyleBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(16),
  borderSide: BorderSide(color: Colors.transparent),
);

BoxDecoration kStyleBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16),
);
BoxDecoration kStyleBoxDecorationTapped = BoxDecoration(
  color: kBtnColour,
  borderRadius: BorderRadius.circular(16),
);
