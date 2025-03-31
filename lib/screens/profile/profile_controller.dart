import 'dart:io';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfileController extends GetxController {
  final Rx<File?> imageFile = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  @override
  void onInit() {
    super.onInit();
    _loadSavedImage();
  }

  Future<void> pickImage(ImageSource source) async {
    final pickedFile = await _picker.pickImage(source: source, imageQuality: 70);
    if (pickedFile != null) {
      final saved = await _saveImage(File(pickedFile.path));
      imageFile.value = saved;
    }
  }

  Future<File> _saveImage(File image) async {
    final dir = await getApplicationDocumentsDirectory();
    final path = '${dir.path}/profile.jpg';
    return await image.copy(path);
  }

  Future<void> _loadSavedImage() async {
    final dir = await getApplicationDocumentsDirectory();
    final file = File('${dir.path}/profile.jpg');
    if (await file.exists()) {
      imageFile.value = file;
    }
  }
}

