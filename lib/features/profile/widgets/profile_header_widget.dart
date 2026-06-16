import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/core.dart';

/// The gradient profile header card showing avatar, name, and email.
class ProfileHeaderWidget extends StatelessWidget {
  const ProfileHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    final avatarSize = getValue<double>(
      mobile: AppDimensions.avatarSize,
      tablet: 90,
      desktop: 110,
    );
    final nameSize = getValue<double>(
      mobile: AppDimensions.fontXXL,
      tablet: AppDimensions.fontXXXL,
      desktop: 28,
    );
    final emailSize = getValue<double>(
      mobile: AppDimensions.fontS,
      tablet: AppDimensions.fontM,
      desktop: AppDimensions.fontL,
    );

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
          Container(
            width: avatarSize.r,
            height: avatarSize.r,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  "https://static.vecteezy.com/system/resources/thumbnails/032/176/197/small/business-avatar-profile-black-icon-man-of-user-symbol-in-trendy-flat-style-isolated-on-male-profile-people-diverse-face-for-social-network-or-web-vector.jpg",
                ),
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
                CustomText(
                  text: 'Md Mahabub Alam',
                  fontSize: nameSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                CustomText(
                  text: 'Flutter Developer',
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
