import 'dart:collection';

import 'package:flutter/material.dart';

class Choose {
  String label;
  bool isSelected;
  String images;

  Choose({
    required this.label,
    this.isSelected = false,
    required this.images,
  });
}

class ChooseData extends ChangeNotifier {
  final List<Choose> _chooseData = [
    Choose(label: 'Pasang Baru', images: 'assets/images/img_psb.svg'),
    Choose(label: 'Gangguan', images: 'assets/images/img_ggn.svg')
  ];

  int get chooseCount {
    return _chooseData.length;
  }

  UnmodifiableListView<Choose> get chooseDatas {
    return UnmodifiableListView(_chooseData);
  }

  String? _selectedChooseData;

  String? get selected {
    return _selectedChooseData;
  }

  set selected(final String? chooseData) {
    _selectedChooseData = chooseData;
    notifyListeners();
  }
}
