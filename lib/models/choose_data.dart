import 'dart:collection';

import 'package:flutter/material.dart';

class Choose {
  String label;
  bool? isSelected;
  String images;

  Choose({
    required this.label,
    this.isSelected,
    required this.images,
  });
}

class ChooseData extends ChangeNotifier {
  final List<Choose> _chooseDatas = [
    Choose(label: 'Provisioning', images: 'assets/images/img_psb.svg'),
    Choose(label: 'Assurance', images: 'assets/images/img_ggn.svg')
  ];

  int get chooseCount {
    return _chooseDatas.length;
  }

  UnmodifiableListView<Choose> get chooseDatas {
    return UnmodifiableListView(_chooseDatas);
  }

  String? _selectedChooseData;

  String? get selected {
    return _selectedChooseData;
  }

  set selected(final String? choose) {
    _selectedChooseData = choose;
    notifyListeners();
  }
}
