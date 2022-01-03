import 'package:flutter/cupertino.dart';

class TextData extends ChangeNotifier {
  String _order = '';
  String _service = '';
  String _name = '';
  String _phone = '';
  String _address = '';
  String _oldONT = '';
  String _newONT = '';
  // String _stb = '';
  // String _sdWan = '';
  // String _dropcore = '';
  // String _precon50 = '';
  // String _precon80 = '';

  String get order {
    return _order;
  }

  String get service {
    return _service;
  }

  String get name {
    return _name;
  }

  String get phone {
    return _phone;
  }

  String get address {
    return _address;
  }

  String get oldONT {
    return _oldONT;
  }

  String get newONT {
    return _newONT;
  }

  getOrder(String order) {
    _order = order;
    notifyListeners();
  }

  getService(String service) {
    _service = service;
    notifyListeners();
  }

  getName(String name) {
    _name = name;
    notifyListeners();
  }

  getPhone(String phone) {
    _phone = phone;
    notifyListeners();
  }

  getAddress(String address) {
    _address = address;
    notifyListeners();
  }

  getOldONT(String oldONT) {
    _oldONT = oldONT;
    notifyListeners();
  }

  getNewONT(String newONT) {
    _newONT = newONT;
    notifyListeners();
  }
}
