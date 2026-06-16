import 'package:expense_tracker/core/utils/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/core.dart';
import '../controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.find<SplashController>();

    return Scaffold(
      backgroundColor: context.appColors.background,
      body: Container(
        height: getHeight(double.infinity),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.exBg1, AppColors.exBg2, AppColors.exBg3],
            end: AlignmentGeometry.bottomRight,
            begin: AlignmentGeometry.topCenter,
            stops: [0.5, 0.7, 1.5],
          ),
          image: DecorationImage(image: AssetImage(ImagePath.expenseLogo)),
        ),
      ),
    );
  }
}
