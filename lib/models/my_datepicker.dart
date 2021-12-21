import 'dart:async';
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MyDatePicker extends ChangeNotifier {
  final dateController = TextEditingController();

  Future<void> selectDate(BuildContext context) async {
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

  // UnmodifiableListView<DateTime> get selectDate {
  //   return UnmodifiableListView(_selectDate);
  // }

  DateTime? _selectedDate;

  String getText() {
    if (_selectedDate == null) {
      return '';
    } else {
      return DateFormat('dd/MM/yyyy').format(_selectedDate!);
    }
  }

  DateTime? get selected {
    return _selectedDate;
  }

  set selected(DateTime? datePicker) {
    _selectedDate = datePicker;
    notifyListeners();
  }
}
