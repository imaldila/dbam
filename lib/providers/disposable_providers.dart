import 'package:d_bam/models/category_data.dart';
import 'package:d_bam/models/choose_data.dart';
import 'package:d_bam/models/counter.dart';
import 'package:d_bam/models/datepicker.dart';
import 'package:d_bam/models/package_data.dart';
import 'package:d_bam/models/text_data.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class DisposableProviders with ChangeNotifier {
  void disposeValue();
}

class AppProviders {
  static List<DisposableProviders> getDisposableProviders(BuildContext context) {
    return [
      context.read<CategoryData>(),
      context.read<Counter>(),
      context.read<DatePicker>(),
      context.read<TextData>(),
      context.read<PackageData>(),
      context.read<ChooseData>(),
    ];
  }

  static void disposeAllDisposableProviders(BuildContext context) {
    getDisposableProviders(context).forEach((disposableProviders) {
      disposableProviders.disposeValue();
    });
  }
}