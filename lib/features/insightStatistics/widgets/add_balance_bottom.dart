import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_size_class.dart';
import '../../../core/widgets/custom_text.dart';

class AddBalanceBottom extends StatelessWidget {
  final String? text;
  final VoidCallback? onTap;
  const AddBalanceBottom({super.key, this.text, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: getHeight(40),
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              const Color(0xFFFF5B1E).withValues(alpha: 0.7),
              AppColors.warningLight.withValues(alpha: 0.8),
            ],
            begin: AlignmentGeometry.centerLeft,
            end: AlignmentGeometry.centerRight,
          ),
        ),
        child: Center(child: CustomText(text: text ?? "Add Balance")),
      ),
    );
  }
}
