import 'package:expense_tracker/core/core.dart';
import 'package:flutter/material.dart';

import 'detail_text_filed.dart';

class DetailInputCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData? icon;
  final int? maxLine;
  final TextEditingController controller;
  const DetailInputCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.icon,
    this.maxLine = 1,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: getHeight(15)),
      child: Container(
        width: double.infinity,
        padding: EdgeInsetsGeometry.only(
          top: getHeight(16),
          left: getWidth(14),
          right: getWidth(14),
          bottom: getHeight(26),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(getRadius(22)),
          color: AppColors.backgroundLight.withValues(alpha: 0.2),
          border: BoxBorder.all(
            width: 1,
            color: AppColors.warningLight.withValues(alpha: 0.4),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: title,
              fontSize: getSp(9),
              color: AppColors.backgroundLight,
              fontWeight: FontWeight.w800,
            ),
            DetailTextFiled(
              maxLine: maxLine,
              controller: controller,
              hintText: subtitle,
            ),
            Divider(
              color: AppColors.warningDark,
              height: 3,
              radius: BorderRadius.circular(getRadius(20)),
              thickness: 2.0,
            ),
          ],
        ),
      ),
    );
  }
}
