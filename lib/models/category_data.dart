import 'dart:collection';

import 'package:d_bam/constants.dart';
import 'package:d_bam/models/category.dart';
import 'package:flutter/cupertino.dart';

TextEditingController ontController = TextEditingController();
TextEditingController stbController = TextEditingController();
TextEditingController sdwanController = TextEditingController();
TextEditingController dropcoreeController = TextEditingController();
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
    Category('Dropcore', kBgColour, false, dropcoreeController),
    Category('Preconn 50M', kBgColour, false, precon50Controller),
    Category('Preconn 80M', kBgColour, false, precon80Controller),
    Category('RJ 45', kBgColour, false, rj45Controller),
    Category('S-Clamp', kBgColour, false, sClampController),
    Category('Clamp Hook', kBgColour, false, clampHookController),
    Category('Roset', kBgColour, false, rosetController),
    Category('SOC', kBgColour, false, socController),
    Category('Tray Cable', kBgColour, false, trayCableController),
    Category('Patchcore', kBgColour, false, patchcoreController),
    Category('Cable UTP', kBgColour, false, cableUTPController),
    // Category('ONT', kBgColour, false, ontController, 0),
    // Category('STB', kBgColour, false, stbController, 0),
    // Category('SD WAN', kBgColour, false, sdwanController, 0),
    // Category('Dropcore', kBgColour, false, dropcoreController, 0),
    // Category('Preconn 50M', kBgColour, false, precon50Controller, 0),
    // Category('Preconn 80M', kBgColour, false, precon80Controller, 0),
    // Category('RJ 11 / RJ 45', kBgColour, false, rj45Controller, 0),
    // Category('S-Clamp', kBgColour, false, sClampController, 0),
    // Category('Clamp Hook', kBgColour, false, clampHookController, 0),
    // Category('Roset', kBgColour, false, rosetController, 0),
    // Category('SOC', kBgColour, false, socController, 0),
    // Category('Tray Cable', kBgColour, false, trayCableController, 0),
    // Category('Patchcore', kBgColour, false, patchcoreController, 0),
    // Category('Cable UTP', kBgColour, false, cableUTPController, 0),
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

  int _counter = 0;

  int get counter => _counter;

  // set counter(final int? categories) {
  //   _counter++;
  //   notifyListeners();
  // }

  void increment() {
    _counter++;
    notifyListeners();
    for (int i = 0; i < categories.length; i++) {
      categories[i].controller.text == _counter.toString();
    }
  }

  void decrement() {
    _counter--;
    notifyListeners();
    for (int i = 0; i < categories.length; i++) {
      categories[i].controller.text = _counter.toString();
    }
  }

  set selected(final String? categories) {
    _selectedCategory = categories;
    notifyListeners();
  }

  void updateCategory(Category categories) {
    categories.toggleDone();
    notifyListeners();
  }
}
