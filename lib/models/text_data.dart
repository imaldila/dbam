import 'package:d_bam/providers/disposable_providers.dart';

class TextData extends DisposableProviders {
  String _psb = 'Pasang Baru';
  String _gangguan = 'Gangguan';
  String _order = '';
  String _service = '';
  String _name = '';
  String _pic = '';
  String _phone = '';
  String _address = '';
  String _oldONT = '';
  String _newONT = '';
  String _oldSTB = '';
  String _newSTB = '';
  String _oldOTHER = '';
  String _newOTHER = '';
  String _dropcore = '';
  String _cableUTP = '';
  String _sto = '';
  String _odc = '';
  String _odp = '';
  String _port = '';
  String _metro = '';
  String _techName = '';
  String _nik = '';

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
  String get pic => _pic;
  String get phone => _phone;
  String get address => _address;
  String get oldONT => _oldONT;
  String get newONT => _newONT;
  String get oldSTB => _oldSTB;
  String get newSTB => _newSTB;
  String get oldOTHER => _oldOTHER;
  String get newOTHER => _newOTHER;
  String get dropcore => _dropcore;
  String get cableUTP => _cableUTP;
  String get sto => _sto;
  String get odc => _odc;
  String get odp => _odp;
  String get port => _port;
  String get metro => _metro;
  String get techName => _techName;
  String get nik => _nik;

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

  getPIC(String pic) {
    _pic = pic;
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

  getOldOTHER(String oldOTHER) {
    _oldOTHER = oldOTHER;
    notifyListeners();
  }

  getNewOTHER(String newOTHER) {
    _newOTHER = newOTHER;
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

  getMetro(String metro) {
    _metro = metro;
    notifyListeners();
  }

  getTechName(String techName) {
    _techName = techName;
    notifyListeners();
  }

  getNIK(String nik) {
    _nik = nik;
    notifyListeners();
  }

  @override
  void disposeValue() {
    _order = '';
    _service = '';
    _name = '';
    _pic = '';
    _phone = '';
    _address = '';
    _oldONT = '';
    _newONT = '';
    _oldSTB = '';
    _newSTB = '';
    _oldOTHER = '';
    _newOTHER = '';
    _dropcore = '';
    _cableUTP = '';
    _sto = '';
    _odc = '';
    _odp = '';
    _port = '';
    _metro = '';
    _techName = '';
    _nik = '';
  }
}
