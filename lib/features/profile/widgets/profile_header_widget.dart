import 'dart:io';
import 'package:expense_tracker/features/profile/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/core.dart';

/// The gradient profile header card showing avatar, name, and email.
class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final avatarSize = getValue<double>(mobile: 90, tablet: 90, desktop: 110);
    final nameSize = getValue<double>(
      mobile: AppDimensions.fontM,
      tablet: AppDimensions.fontXXL,
      desktop: 28,
    );
    final emailSize = getValue<double>(
      mobile: AppDimensions.fontXS,
      tablet: AppDimensions.fontM,
      desktop: AppDimensions.fontL,
    );
    final controller = Get.put(ProfileController());
    return Container(
      padding: EdgeInsets.all(AppDimensions.paddingXL.r),
      decoration: BoxDecoration(
        gradient: colors.primaryGradient,
        borderRadius: BorderRadius.circular(AppDimensions.radiusXL.r),
        boxShadow: [
          BoxShadow(
            color: colors.primary.withValues(alpha: 0.2),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          controller.imagePath.isEmpty
              ? Container(
                  width: avatarSize.r,
                  height: avatarSize.r,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(
                        "https://static.vecteezy.com/system/resources/thumbnails/032/176/197/small/business-avatar-profile-black-icon-man-of-user-symbol-in-trendy-flat-style-isolated-on-male-profile-people-diverse-face-for-social-network-or-web-vector.jpg",
                      ),
                    ),

                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.warningDark,
                      width: AppDimensions.borderWidthExtraThick,
                    ),
                  ),
                )
              : Container(
                  width: avatarSize.r,
                  height: avatarSize.r,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: FileImage(File(controller.imagePath.value)),
                    ),

                    color: Colors.white,
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: AppDimensions.borderWidthExtraThick,
                    ),
                  ),
                ),
          SizedBox(width: AppDimensions.spaceL.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                controller.nameClt.text.isEmpty
                    ? CustomText(
                        text: "No Name",
                        fontSize: nameSize,
                        fontWeight: FontWeight.bold,
                        color: AppColors.warningDark,
                      )
                    : CustomText(
                        text: controller.nameClt.text.trim(),
                        fontSize: nameSize,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                controller.descriptionClt.text.isEmpty
                    ? CustomText(
                        text: "No Description",
                        fontSize: emailSize,
                        color: Colors.white.withValues(alpha: 0.8),
                      )
                    : CustomText(
                        text: controller.descriptionClt.text.trim(),
                        fontSize: emailSize,
                        color: Colors.white.withValues(alpha: 0.8),
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
