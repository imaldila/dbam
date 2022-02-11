import 'dart:async';

import 'package:d_bam/providers/disposable_providers.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends DisposableProviders {
  final dateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
    // ignore: unused_local_variable
    final DateTime? selectDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(DateTime.now().year - 5),
      lastDate: DateTime(DateTime.now().year + 5),
    ).then((selectDate) {
      _selectedDate = selectDate;
    });
    dateController.text = getText();
  }

  String getText() {
    if (_selectedDate == null) {
      return '';
    } else {
      return DateFormat('dd-MM-yyyy').format(_selectedDate!);
    }
  }

  DateTime? _selectedDate = DateTime.tryParse('');

  // DateTime? get selected {
  //   return _selectedDate;
  // }

  String? get selected {
    if (_selectedDate == null) {
      return '';
    } else {
      return DateFormat('dd-MM-yyyy').format(_selectedDate!);
    }
  }

  @override
  void disposeValue() {
    _selectedDate = null;
    dateController.text = '';
  }
}
