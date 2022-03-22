import 'dart:io';

import 'package:d_bam/providers/disposable_providers.dart';
import 'package:image_picker/image_picker.dart';

class Evident extends DisposableProviders {
  final List<File> evidents = [];

  int get evidentCount => evidents.length;

  final imagePick = ImagePicker();

  chooseImages() async {
    final pickedFile = await imagePick.pickImage(
      source: ImageSource.gallery,
      imageQuality: 20,
      maxHeight: 1920,
      maxWidth: 1080,
    );
    if (pickedFile != null) {
      evidents.add(File(pickedFile.path));
      notifyListeners();
    }
  }

  void clearImage(int i) {
    evidents.removeAt(i);
    notifyListeners();
  }

  @override
  void disposeValue() {
    evidents.clear();
  }
}
