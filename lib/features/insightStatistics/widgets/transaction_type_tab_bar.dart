import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_size_class.dart';
import '../../../core/widgets/custom_text.dart';
import '../controller/transaction_controller.dart';

class TransactionTypeTabBar extends StatelessWidget {
  final ValueChanged<int> onTabChange;
  const TransactionTypeTabBar({super.key, required this.onTabChange});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionController>();

    return Obx(
      () => Row(
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () => onTabChange(0),
              child: Container(
                height: getHeight(50),
                color: controller.selectedTab.value == 0
                    ? const Color(0xFFFF5B1E).withValues(alpha: 0.9)
                    : const Color(0xFFFF5B1E).withValues(alpha: 0.3),
                child: const Center(child: CustomText(text: "INCOME")),
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              onTap: () => onTabChange(1),
              child: Container(
                height: getHeight(50),
                color: controller.selectedTab.value == 1
                    ? AppColors.warningLight.withValues(alpha: 0.9)
                    : AppColors.warningLight.withValues(alpha: 0.3),
                child: const Center(child: CustomText(text: "EXPENSE")),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
