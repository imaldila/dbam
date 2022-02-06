import 'package:flutter/cupertino.dart';

class Category {
  String label;
  Color colour;
  bool isSelected;
  TextEditingController controller;

  Category(this.label, this.colour, this.isSelected, this.controller);

  void toggleDone() {
    isSelected = !isSelected;
  }
}
