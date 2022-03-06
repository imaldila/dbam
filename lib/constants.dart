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

final kTextStyle14Bold = GoogleFonts.poppins(
  textStyle: TextStyle(
    fontSize: 14,
    color: kDarkColour,
    fontWeight: FontWeight.w600,
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
  borderSide: BorderSide(
    color: kDarkColour.withOpacity(0.2),
    width: 3,
  ),
);
OutlineInputBorder kErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(16),
  borderSide: BorderSide(
    color: Colors.red,
    width: 2,
  ),
);

BoxDecoration kStyleBoxDecoration = BoxDecoration(
  color: Colors.white,
  borderRadius: BorderRadius.circular(16),
);
BoxDecoration kStyleBoxDecorationTapped = BoxDecoration(
  color: kBtnColour,
  borderRadius: BorderRadius.circular(16),
);

const String kHeadDesc =
    'Pada hari ini, telah dilakukan instalasi sesuai layanan di atas dengan data dan hasil sebagai berikut: ';
const String kDisclaimer1 =
    '1. Perangkat (ONT/Modem/STB) yang dipasang di rumah pelanggan adalah MILIK TELKOM yang dipinjamkan selama menjadi pelanggan TELKOM. Modem yang tidak dipakai karena Migrasi ke Fiber ditarik kembali.';
const String kDisclaimer2 =
    '2. Telkom dapat mengambil Perangkat bila tidak ada penggunaan selama 3 bulan berturut-turut.';
const String kDisclaimer3 =
    '3. Untuk progress pemilihan dan monitoring diharapkan power Perangkat selalu dalam kondisi hidup(ON)';
const String kDisclaimer4 =
    '4. Disarankan untuk segera merubah password yang ada untuk menjaga agar tidak dipergunakan oleh pihak-pihak yang tidak dikehendaki.';
const String kDisclaimer5 =
    '5. Pelanggan sudah mendapatkan penjelasan dari sales/setter atau menerima buku petunjuk menggunakan modem internet yang telah dipasang.';
