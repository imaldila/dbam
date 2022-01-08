import 'package:flutter/cupertino.dart';

class Category {
  String label;
  Color colour;
  bool isSelected;
  TextEditingController controller;
  int count = 0;

  Category(
      this.label, this.colour, this.isSelected, this.controller, this.count);

  void toggleDone() {
    isSelected = !isSelected;
  }

  void decrement() {
    count--;
  }
  void increment() {
    count++;
  }

  void counter() => count = 0;
}
