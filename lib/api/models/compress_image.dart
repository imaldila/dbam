import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_image_compress/flutter_image_compress.dart';

class CompressImage {
  ImageProvider? provider;
  void getFileImage() async {
    final imgTA = AssetImage('assets/images/logo_ta.png');
    print('pre compress');
    final config = ImageConfiguration();

    AssetBundleImageKey key = await imgTA.obtainKey(config);
    final ByteData data = await key.bundle.load(key.name);
    final dir = await path_provider.getTemporaryDirectory();
    print('dir = $dir');

    File file = createFile('${dir.absolute.path}/logo_ta.png');
    file.writeAsBytesSync(data.buffer.asUint8List());

    final result = await testCompressFile(file);

    if (result == null) return;

    ImageProvider provider = MemoryImage(result);
    this.provider = provider;
  }

  File createFile(String path) {
    final file = File(path);
    if (!file.existsSync()) {
      file.createSync(recursive: true);
    }
    return file;
  }

  Future<Uint8List?> testCompressFile(File file) async {
    print('testCompressFile');
    final result = await FlutterImageCompress.compressWithFile(
      file.absolute.path,
      minWidth: 2300,
      minHeight: 1500,
      quality: 94,
      // rotate: 180,
    );
    print(file.lengthSync());
    print(result?.length);
    return result;
  }
}
