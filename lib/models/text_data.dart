import 'package:d_bam/providers/disposable_providers.dart';

class TextData extends DisposableProviders {
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
  String _sto = '';
  String _odc = '';
  String _odp = '';
  String _port = '';
  String _techName = '';

  String get psb => _psb;
  String get gangguan => _gangguan;

  getPSB(String psb) {
    _psb = psb;
    notifyListeners();
  }

  set getGangguan(String gangguan) {
    _gangguan = gangguan;
    notifyListeners();
  }

  String get order => _order;
  String get service => _service;
  String get name => _name;
  String get phone => _phone;
  String get address => _address;
  String get oldONT => _oldONT;
  String get newONT => _newONT;
  String get oldSTB => _oldSTB;
  String get newSTB => _newSTB;
  String get oldSDWAN => _oldSDWAN;
  String get newSDWAN => _newSDWAN;
  String get dropcore => _dropcore;
  String get cableUTP => _cableUTP;
  String get sto => _sto;
  String get odc => _odc;
  String get odp => _odp;
  String get port => _port;

  String get techName => _techName;

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

  getSTO(String sto) {
    _sto = sto;
    notifyListeners();
  }

  getODC(String odc) {
    _odc = odc;
    notifyListeners();
  }

  getODP(String odp) {
    _odp = odp;
    notifyListeners();
  }

  getPort(String port) {
    _port = port;
    notifyListeners();
  }

  getTechName(String techName) {
    _techName = techName;
    notifyListeners();
  }

  @override
  void disposeValue() {
    _order = '';
    _service = '';
    _name = '';
    _phone = '';
    _address = '';
    _oldONT = '';
    _newONT = '';
    _oldSTB = '';
    _newSTB = '';
    _oldSDWAN = '';
    _newSDWAN = '';
    _dropcore = '';
    _cableUTP = '';
    _sto = '';
    _odc = '';
    _odp = '';
    _port = '';
    _techName = '';
  }
}
