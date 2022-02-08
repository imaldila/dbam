import 'package:flutter/cupertino.dart';

class TextData extends ChangeNotifier {
  String _psb = 'Pasang Baru';
  String _gangguan = 'Gangguan';
  String _order = '';
  String _service = '';
  String _name = '';
  String _phone = '';
  String _address = '';
  String _oldONT = '';
  String _newONT = '';
  String _oldSTB = '';
  String _newSTB = '';
  String _oldSDWAN = '';
  String _newSDWAN = '';
  String _dropcore = '';
  String _cableUTP = '';

  String get psb => _psb;
  String get gangguan => _gangguan;

  getPSB(String psb) {
    _psb = psb;
  }

  set getGangguan(String gangguan) {
    _gangguan = gangguan;
    notifyListeners();
  }

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

  String get oldSTB {
    return _oldSTB;
  }

  String get newSTB {
    return _newSTB;
  }

  String get oldSDWAN {
    return _oldSDWAN;
  }

  String get newSDWAN {
    return _newSDWAN;
  }

  String get dropcore {
    return _dropcore;
  }

  String get cableUTP {
    return _cableUTP;
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

  getOldSTB(String oldSTB) {
    _oldSTB = oldSTB;
    notifyListeners();
  }

  getNewSTB(String newSTB) {
    _newSTB = newSTB;
    notifyListeners();
  }

  getOldSDWAN(String oldSDWAN) {
    _oldSDWAN = oldSDWAN;
    notifyListeners();
  }

  getNewSDWAN(String newSDWAN) {
    _newSDWAN = newSDWAN;
    notifyListeners();
  }

  getDropcore(String dropCore) {
    _dropcore = dropCore;
    notifyListeners();
  }

  getCableUTP(String cableUTP) {
    _cableUTP = cableUTP;
    notifyListeners();
  }
}
