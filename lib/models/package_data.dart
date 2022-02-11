import 'dart:collection';

import 'package:d_bam/providers/disposable_providers.dart';
// import 'package:flutter/material.dart';

class PackageData extends DisposableProviders {
  final List<String> _packages = <String>[
    '1P',
    '2P',
    '3P',
    'VPNIP',
    'ASTINET',
    'METRO-E',
    'SIP-TRUNK',
    'OTHERS',
    // final List<Package> _packages = [
    //   Package(name: '1P'),
    //   Package(name: '2P'),
    //   Package(name: '3P'),
    //   Package(name: 'VPNIP'),
    //   Package(name: 'ASTINET'),
    //   Package(name: 'METRO-E'),
    //   Package(name: 'SIP-TRUNK'),
    //   Package(name: 'OTHERS'),
  ];

  String? _selectedPackage;

  UnmodifiableListView<String> get packages {
    return UnmodifiableListView(_packages);
  }

  String? get selected {
    if (_selectedPackage == null) {
      return null;
    } else {
      return _selectedPackage;
    }
  }

  set selected(final String? package) {
    _selectedPackage = package;
    notifyListeners();
  }

  @override
  void disposeValue() {
    _selectedPackage = null;
  }
}
