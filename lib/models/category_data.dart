import 'dart:collection';

import 'package:d_bam/constants.dart';
import 'package:d_bam/models/category.dart';
import 'package:flutter/cupertino.dart';

TextEditingController ontController = TextEditingController();
TextEditingController stbController = TextEditingController();
TextEditingController sdwanController = TextEditingController();
TextEditingController dropcoreController = TextEditingController();
TextEditingController precon50Controller = TextEditingController();
TextEditingController precon80Controller = TextEditingController();
TextEditingController rj45Controller = TextEditingController();
TextEditingController sClampController = TextEditingController();
TextEditingController clampHookController = TextEditingController();
TextEditingController rosetController = TextEditingController();
TextEditingController socController = TextEditingController();
TextEditingController trayCableController = TextEditingController();
TextEditingController patchcoreController = TextEditingController();
TextEditingController cableUTPController = TextEditingController();

class CategoryData extends ChangeNotifier {
  // bool selected = false;
  final List<Category> _categories = [
    Category('ONT', kBgColour, false, ontController),
    Category('STB', kBgColour, false, stbController),
    Category('SD WAN', kBgColour, false, sdwanController),
    Category('Dropcore', kBgColour, false, dropcoreController),
    Category('Preconn 50M', kBgColour, false, precon50Controller),
    Category('Preconn 80M', kBgColour, false, precon80Controller),
    Category('RJ 11 / RJ 45', kBgColour, false, rj45Controller),
    Category('S-Clamp', kBgColour, false, sClampController),
    Category('Clamp Hook', kBgColour, false, clampHookController),
    Category('Roset', kBgColour, false, rosetController),
    Category('SOC', kBgColour, false, socController),
    Category('Tray Cable', kBgColour, false, trayCableController),
    Category('Patchcore', kBgColour, false, patchcoreController),
    Category('Cable UTP', kBgColour, false, cableUTPController),
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
