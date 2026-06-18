import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_size_class.dart';

class DetailTextFiled extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final int? maxLine;
  const DetailTextFiled({
    super.key,
    required this.controller,
    this.hintText = "",
    this.maxLine = 1,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLine,
      controller: controller,
      style: TextStyle(
        fontSize: getSp(12),
        color: AppColors.elevatedSurfaceLight,
      ),
      decoration: InputDecoration(
        focusColor: Colors.transparent,
        fillColor: Colors.transparent,
        hoverColor: Colors.transparent,
        border: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: hintText,
        hintStyle: TextStyle(
          fontSize: getSp(12),
          color: AppColors.borderLight.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}
