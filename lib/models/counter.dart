import 'package:d_bam/providers/disposable_providers.dart';

class Counter extends DisposableProviders {
  int _preconn50 = 0;

  int get preconn50 => _preconn50;

  getPreconn50(String preconn50) {
    _preconn50 = int.parse(preconn50);
    notifyListeners();
  }

  void incPreconn50() {
    _preconn50++;
    notifyListeners();
  }

  void decPreconn50() {
    _preconn50--;
    notifyListeners();
  }

  int _preconn80 = 0;

  int get preconn80 => _preconn80;

  getPreconn80(String preconn50) {
    _preconn80 = int.parse(preconn50);
    notifyListeners();
  }

  void incPreconn80() {
    _preconn80++;
    notifyListeners();
  }

  void decPreconn80() {
    _preconn80--;
    notifyListeners();
  }

  int _rj45 = 0;

  int get rj45 => _rj45;

  getRJ45(String rj45) {
    _rj45 = int.parse(rj45);
    notifyListeners();
  }

  void incRJ45() {
    _rj45++;
    notifyListeners();
  }

  void decRJ45() {
    _rj45--;
    notifyListeners();
  }

  int _sClamp = 0;

  int get sClamp => _sClamp;

  getSclamp(String sClamp) {
    _sClamp = int.parse(sClamp);
    notifyListeners();
  }

  void incSclamp() {
    _sClamp++;
    notifyListeners();
  }

  void decSclamp() {
    _sClamp--;
    notifyListeners();
  }

  int _otp = 0;
  int get otp => _otp;

  getOTP(String otp) {
    _otp = int.parse(otp);
    notifyListeners();
  }

  void incOTP() {
    _otp++;
    notifyListeners();
  }

  void decOTP() {
    _otp--;
    notifyListeners();
  }

  int _prekso = 0;
  int get prekso => _prekso;

  getPrekso(String prekso) {
    _prekso = int.parse(prekso);
    notifyListeners();
  }

  void incPrekso() {
    _prekso++;
    notifyListeners();
  }

  void decPrekso() {
    _prekso--;
    notifyListeners();
  }

  int _roset = 0;

  int get roset => _roset;

  getRoset(String roset) {
    _roset = int.parse(roset);
    notifyListeners();
  }

  void incRoset() {
    _roset++;
    notifyListeners();
  }

  void decRoset() {
    _roset--;
    notifyListeners();
  }

  int _clampHook = 0;

  int get clampHook => _clampHook;

  getClampHook(String clampHook) {
    _clampHook = int.parse(clampHook);
    notifyListeners();
  }

  void incClampHook() {
    _clampHook++;
    notifyListeners();
  }

  void decClampHook() {
    _clampHook--;
    notifyListeners();
  }

  int _soc = 0;

  int get soc => _soc;

  getSOC(String soc) {
    _soc = int.parse(soc);
    notifyListeners();
  }

  void incSOC() {
    _soc++;
    notifyListeners();
  }

  void decSOC() {
    _soc--;
    notifyListeners();
  }

  int _trayCable = 0;

  int get trayCable => _trayCable;

  getTrayCable(String trayCable) {
    _trayCable = int.parse(trayCable);
    notifyListeners();
  }

  void incTrayCable() {
    _trayCable++;
    notifyListeners();
  }

  void decTrayCable() {
    _trayCable--;
    notifyListeners();
  }

  int _patchCore = 0;

  int get patchCore => _patchCore;

  getPatchcore(String patchCore) {
    _patchCore = int.parse(patchCore);
    notifyListeners();
  }

  void incPatchcore() {
    _patchCore++;
    notifyListeners();
  }

  void decPatchcore() {
    _patchCore--;
    notifyListeners();
  }

  int _cableUTP = 0;

  int get cableUTP => _cableUTP;

  getCableUTP(String cableUTP) {
    _cableUTP = int.parse(cableUTP);
    notifyListeners();
  }

  void incCableUTP() {
    _cableUTP++;
    notifyListeners();
  }

  void decCableUTP() {
    _cableUTP--;
    notifyListeners();
  }

  @override
  void disposeValue() {
    _cableUTP = 0;
    _clampHook = 0;
    _otp = 0;
    _patchCore = 0;
    _preconn50 = 0;
    _preconn80 = 0;
    _prekso = 0;
    _rj45 = 0;
    _roset = 0;
    _sClamp = 0;
    _soc = 0;
    _trayCable = 0;
  }
}
