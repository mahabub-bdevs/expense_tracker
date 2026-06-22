import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/features/insightStatistics/controller/insight_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/add_balance_bottom.dart';
import '../widgets/add_balance_text_filed.dart';
import '../widgets/numeric_keyboard.dart';

class AddBalanceScreen extends StatelessWidget {
  const AddBalanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<InsightController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: getWidth(12)),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close, size: getSp(25)),
          ),
        ),
        actions: [
          CustomText(
            text: "Payment Method",
            fontSize: getSp(10),
            color: AppColors.warningDark,
          ),
          Icon(
            Icons.keyboard_arrow_down,
            size: getSp(20),
            color: AppColors.warningDark,
          ),
          SizedBox(width: getWidth(20)),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.exBg3,
              AppColors.exBg1,
              AppColors.exBg2,
              AppColors.exBg3,
            ],
            begin: AlignmentGeometry.topStart,
            end: AlignmentGeometry.centerEnd,
            stops: [0.2, 0.4, 0.7, 1.5],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: getHeight(80)),
            SizedBox(height: getHeight(15)),
            AddBalanceTextFiled(controller: controller.amountController),
            const Spacer(),
            AddBalanceBottom(
              onTap: () {
                controller.addBalanceBottom();
              },
            ),
            30.h.verticalSpace,
            Expanded(
              child: NumericKeyboard(
                value: controller.amountController.text,
                onKeyTap: controller.onKeyTap,
                onBackspace: controller.onBackspace,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
