import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/core/utils/app_icons.dart';
import 'package:expense_tracker/core/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyDataItem extends StatelessWidget {
  const EmptyDataItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CustomSvgIcon(
          assetName: IconPath.emptyIcon,
          height: getHeight(100),
          width: getWidth(130),
          color: AppColors.warningDark,
        ),
        15.h.verticalSpace,
        CustomText(
          text: "No Results Found",
          fontSize: getSp(14),
          color: AppColors.backgroundLight,
        ),
      ],
    );
  }
}
