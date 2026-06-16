import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/core/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SidebarTileItem extends StatelessWidget {
  final String imagePath;
  final String name;
  const SidebarTileItem({
    super.key,
    required this.imagePath,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: getWidth(15), top: getHeight(18)),
      child: Row(
        children: [
          CustomSvgIcon(
            assetName: imagePath,
            height: getHeight(20),
            width: getWidth(20),
          ),
          40.w.horizontalSpace,
          CustomText(
            text: name,
            fontSize: getSp(12),
            color: AppColors.backgroundLight,
            fontWeight: FontWeight.w800,
          ),
        ],
      ),
    );
  }
}
