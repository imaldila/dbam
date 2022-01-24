import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends ChangeNotifier {
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
      return DateFormat('dd/MM/yyyy').format(_selectedDate!);
    }
  }

  // UnmodifiableListView<DateTime> get selectDate {
  //   return UnmodifiableListView(_selectDate);
  // }

  DateTime? _selectedDate;

  DateTime? get selected {
    return _selectedDate;
  }

  set selected(DateTime? datePicker) {
    _selectedDate = datePicker;
    notifyListeners();
  }

  @override
  void dispose() {
    dateController.clear();
    super.dispose();
  }
}
