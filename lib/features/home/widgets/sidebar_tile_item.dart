import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/core/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SidebarTileItem extends StatelessWidget {
  final String imagePath;
  final String name;
  final VoidCallback ? onTap;
  const SidebarTileItem({
    super.key,
    required this.imagePath,
    required this.name, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
