import 'package:flutter/material.dart';

class L10n {
  static final all = [
    const Locale('en'),
    const Locale('id'),
  ];

  static String getFlag(String code) {
    switch (code) {
      case 'id':
        return 'assets/images/flag_id.png';
      case 'en':
        return 'assets/images/flag_en.png';
      default:
        return 'assets/images/flag_id.png';
    }
  }
}
