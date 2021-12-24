import 'package:flutter/cupertino.dart';

class Category {
  String label;
  Color colour;
  bool isSelected;

  Category(this.label, this.colour, this.isSelected);

  void toggleDone() {
    isSelected = !isSelected;
  }
}
