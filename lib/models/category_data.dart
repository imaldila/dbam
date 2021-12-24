import 'dart:collection';

import 'package:d_bam/constants.dart';
import 'package:d_bam/models/category.dart';
import 'package:flutter/cupertino.dart';

class CategoryData extends ChangeNotifier {
  // bool selected = false;
  final List<Category> _categories = [
    Category('ONT', kBgColour, false),
    Category('STB', kBgColour, false),
    Category('SD WAN', kBgColour, false),
    Category('Dropcore', kBgColour, false),
    Category('Preconn 50M', kBgColour, false),
    Category('Preconn 80M', kBgColour, false),
    Category('RJ 11 / RJ 45', kBgColour, false),
    Category('S-Clamp', kBgColour, false),
    Category('Clamp Hook', kBgColour, false),
    Category('Roset', kBgColour, false),
    Category('SOC', kBgColour, false),
    Category('Tray Cable', kBgColour, false),
    Category('Patchcore', kBgColour, false),
    Category('Cable UTP', kBgColour, false),
  ];

  int get categoryCount {
    return _categories.length;
  }

  String? _selectedCategory;

  UnmodifiableListView<Category> get categories {
    return UnmodifiableListView(_categories);
  }

  String? get selected {
    return _selectedCategory;
  }

  set selected(final String? category) {
    _selectedCategory = category;
    notifyListeners();
  }

  void updateCategory(Category category) {
    category.toggleDone();
    notifyListeners();
  }


}
