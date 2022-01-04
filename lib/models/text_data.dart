import 'package:flutter/cupertino.dart';

class TextData extends ChangeNotifier {
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
  String _precon50 = '';
  String _precon80 = '';
  String _rj45 = '';
  String _sClamp = '';
  String _clampHook = '';
  String _roset = '';
  String _soc = '';
  String _trayCable = '';
  String _patchcore = '';
  String _cableUTP = '';

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

  String get precon50 {
    return _precon50;
  }

  String get precon80 {
    return _precon80;
  }

  String get rj45 {
    return _rj45;
  }

  String get sClamp {
    return _sClamp;
  }

  String get clampHook {
    return _clampHook;
  }

  String get roset {
    return _roset;
  }

  String get soc {
    return _soc;
  }

  String get trayCable {
    return _trayCable;
  }

  String get patchCore {
    return _patchcore;
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

  getDropcore(String newDropcore) {
    _dropcore = newDropcore;
    notifyListeners();
  }

  getPrecon50(String newPrecon50) {
    _precon50 = newPrecon50;
    notifyListeners();
  }

  getPrecon80(String newPrecon80) {
    _precon80 = newPrecon80;
    notifyListeners();
  }

  getRJ45(String newRJ45) {
    _rj45 = newRJ45;
    notifyListeners();
  }

  getSClamp(String newSClamp) {
    _sClamp = newSClamp;
    notifyListeners();
  }

  getClampHook(String newClampHook) {
    _clampHook = newClampHook;
    notifyListeners();
  }

  getRoset(String newRoset) {
    _roset = newRoset;
    notifyListeners();
  }

  getSoc(String newSoc) {
    _soc = newSoc;
    notifyListeners();
  }

  getTrayCable(String newTrayCable) {
    _trayCable = newTrayCable;
    notifyListeners();
  }

  getPatchcore(String newPatchcore) {
    _patchcore = newPatchcore;
    notifyListeners();
  }

  getCableUTP(String newCableUTP) {
    _cableUTP = newCableUTP;
    notifyListeners();
  }
}
