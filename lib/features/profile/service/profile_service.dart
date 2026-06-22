import 'dart:io';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

class ProfileService {
  static const String _nameKey = 'name';
  static const String _descriptionKey = 'description';
  static const String _imagePathKey = 'imagePath';

  final Box _box = Hive.box('profile');

  Future<void> saveProfile(String name, String description) async {
    final existingName = _box.get(_nameKey);
    if (existingName != null) {
      Get.snackbar("এরর", "প্রোফাইল আগেই আছে, update করুন");
      return;
    }
    await _box.put(_nameKey, name);
    await _box.put(_descriptionKey, description);
  }

  Future<void> updateProfile(String name, String description) async {
    final existingName = _box.get(_nameKey);
    if (existingName == null) {
      Get.snackbar("এরর", "আগে প্রোফাইল save করুন");
      return;
    }
    await _box.put(_nameKey, name);
    await _box.put(_descriptionKey, description);
  }

  bool hasProfile() => _box.get(_nameKey) != null;

  //  Image pick and save
  Future<String?> pickAndSaveImage() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.gallery);
    if (picked == null) return null;

    final appDir = await getApplicationDocumentsDirectory();
    final saved = await File(
      picked.path,
    ).copy('${appDir.path}/profile_image.jpg');
    await _box.put(_imagePathKey, saved.path);
    return saved.path;
  }

  //  Update image
  Future<String?> updateImage() async {
    return await pickAndSaveImage();
  }

  // Getters
  String getName() => _box.get(_nameKey, defaultValue: '');
  String getDescription() => _box.get(_descriptionKey, defaultValue: '');
  String? getImagePath() => _box.get(_imagePathKey);
}
