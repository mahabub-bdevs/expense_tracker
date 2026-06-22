import 'dart:io';
import 'package:expense_tracker/core/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';

class ProfileInputItem extends StatelessWidget {
  const ProfileInputItem({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());

    return Scaffold(
      backgroundColor: const Color(0xFF1E1B2E),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Obx(
          () => Text(
            controller.hasProfile.value
                ? "প্রোফাইল আপডেট"
                : "প্রোফাইল সেট করুন",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            const SizedBox(height: 20),

            // Image
            Obx(
              () => GestureDetector(
                onTap: () => controller.hasProfile.value
                    ? controller.updateImage()
                    : controller.pickImage(),
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundColor: Colors.white12,
                      backgroundImage: controller.imagePath.value.isNotEmpty
                          ? FileImage(File(controller.imagePath.value))
                          : null,
                      child: controller.imagePath.value.isEmpty
                          ? const Icon(
                              Icons.person,
                              size: 60,
                              color: Colors.white54,
                            )
                          : null,
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          color: Colors.deepPurple,
                          shape: BoxShape.circle,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            //  Name
            TextField(
              controller: controller.nameClt,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "নাম",
                labelStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(
                  Icons.person_outline,
                  color: Colors.white54,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),

            const SizedBox(height: 16),

            //  Description
            TextField(
              controller: controller.descriptionClt,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                labelText: "বিবরণ",
                labelStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(
                  Icons.info_outline,
                  color: Colors.white54,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.white24),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: Colors.deepPurple),
                ),
              ),
            ),

            const SizedBox(height: 32),

            //  Save বা Update button
            Obx(
              () => SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => controller.hasProfile.value
                      ? controller.updateProfile()
                      : controller.saveProfile(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: CustomText(
                    text: controller.hasProfile.value
                        ? "আপডেট করুন"
                        : "সেভ করুন",
                    fontSize: getSp(10),
                    color: AppColors.backgroundLight,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
