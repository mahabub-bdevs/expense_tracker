import 'package:expense_tracker/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../service/profile_service.dart';

class ProfileController extends GetxController {
  final nameClt = TextEditingController();
  final descriptionClt = TextEditingController();
  final idClt = TextEditingController();

  final ProfileService _service = ProfileService();

  RxString name = ''.obs;
  RxString description = ''.obs;
  RxString imagePath = ''.obs;
  RxBool hasProfile = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadProfile();
  }

  void loadProfile() {
    name.value = _service.getName();
    description.value = _service.getDescription();
    imagePath.value = _service.getImagePath() ?? '';
    hasProfile.value = _service.hasProfile();

    nameClt.text = name.value;
    descriptionClt.text = description.value;
  }

  Future<void> saveProfile() async {
    if (nameClt.text.trim().isEmpty || descriptionClt.text.trim().isEmpty) {
      Get.snackbar("এরর", "নাম এবং বিবরণ দিন");
      return;
    }

    if (_service.hasProfile()) {
      Get.snackbar("এরর", "প্রোফাইল আগেই আছে, আপডেট করুন");
      return;
    }

    await _service.saveProfile(nameClt.text.trim(), descriptionClt.text.trim());

    loadProfile();
    Get.offAllNamed(AppRoutes.main);
  }

  Future<void> updateProfile() async {
    if (nameClt.text.trim().isEmpty || descriptionClt.text.trim().isEmpty) {
      Get.snackbar("এরর", "নাম এবং বিবরণ দিন");
      return;
    }

    if (!_service.hasProfile()) {
      Get.snackbar("এরর", "আগে প্রোফাইল সেভ করুন");
      return;
    }

    await _service.updateProfile(
      nameClt.text.trim(),
      descriptionClt.text.trim(),
    );
    loadProfile();
    Get.offAllNamed(AppRoutes.main);
  }

  Future<void> pickImage() async {
    if (_service.hasProfile()) {
      Get.snackbar("এরর", "আগে প্রোফাইল সেভ করুন, তারপর ছবি দিন");
      return;
    }
    final path = await _service.pickAndSaveImage();
    if (path != null) {
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
      imagePath.value = path;
      imagePath.refresh();
    }
  }

  Future<void> updateImage() async {
    if (!_service.hasProfile()) {
      Get.snackbar("এরর", "আগে প্রোফাইল সেভ করুন");
      return;
    }
    final path = await _service.updateImage();
    if (path != null) {
      PaintingBinding.instance.imageCache.clear();
      PaintingBinding.instance.imageCache.clearLiveImages();
      imagePath.value = path;
      imagePath.refresh();
    }
  }
}
