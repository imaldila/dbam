import 'dart:collection';

import 'package:d_bam/models/package.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';

class PackageData extends ChangeNotifier {
  final List<Package> _packages = <Package>[
    Package(name: '1P'),
    Package(name: '2P'),
    Package(name: '3P'),
    Package(name: 'VPNIP'),
    Package(name: 'ASTINET'),
    Package(name: 'METRO-E'),
    Package(name: 'SIP-TRUNK'),
    Package(name: 'OTHERS'),
  ];

  int get packageCount {
    return _packages.length;
  }

  UnmodifiableListView<Package> get packages {
    return UnmodifiableListView(_packages);
  }

  void getPackages() {
    for (var getPackages in _packages) {
      print(getPackages);
    }
  }
}
