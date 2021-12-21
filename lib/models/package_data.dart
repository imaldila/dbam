import 'dart:collection';

import 'package:flutter/foundation.dart';

class PackageData extends ChangeNotifier {
  final List<String> _packages = <String>[
    '1P',
    '2P',
    '3P',
    'VPNIP',
    'ASTINET',
    'METRO-E',
    'SIP-TRUNK',
    'OTHERS',
    // Package(name: '1P'),
    // Package(name:'2P'),
    // Package(name:'3P'),
    // Package(name:'VPNIP'),
    // Package(name:'ASTINET'),
    // Package(name:'METRO-E'),
    // Package(name:'SIP-TRUNK'),
    // Package(name:'OTHERS'),
  ];

  String? _selectedPackage;

  UnmodifiableListView<String> get packages {
    return UnmodifiableListView(_packages);
  }

  String? get selected {
    return _selectedPackage;
  }

  set selected(final String? package) {
    _selectedPackage = package;
    notifyListeners();
  }
}
