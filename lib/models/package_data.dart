import 'dart:collection';

import 'package:d_bam/models/package.dart';
import 'package:flutter/foundation.dart';

class PackageData extends ChangeNotifier {
  final List<String> _packages = <String>[
    '1P',
    '2P',
    '3P',
    'VPNIP',
    'ASTINET',
    'METRO-E',
    'SIP-TRUNK'
        'OTHERS',
    // Package('1P'),
    // Package('2P'),
    // Package('3P'),
    // Package('VPNIP'),
    // Package('ASTINET'),
    // Package('METRO-E'),
    // Package('SIP-TRUNK'),
    // Package('OTHERS'),
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
