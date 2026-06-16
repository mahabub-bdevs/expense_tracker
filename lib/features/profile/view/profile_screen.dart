import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/core.dart';
import '../widgets/payment_card_item.dart';
import '../widgets/profile_header_widget.dart';
import '../widgets/profile_settings_section.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final maxWidth = getValue<double>(
      mobile: double.infinity,
      tablet: 640,
      desktop: 720,
    );

    return SingleChildScrollView(
      padding: EdgeInsets.all(AppDimensions.paddingL.r),
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              50.h.verticalSpace,
              const ProfileHeaderWidget(),
              SizedBox(height: AppDimensions.spaceXXL.h),
              const ProfileSettingsSectionWidget(),
              SizedBox(height: AppDimensions.spaceXXL.h),
              PaymentCardItem()
            ],
          ),
        ),
      ),
    );
  }
}
