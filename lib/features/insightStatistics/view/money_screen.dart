import 'package:expense_tracker/features/insightStatistics/widgets/transaction_form_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/utils/app_size_class.dart';
import '../controller/transaction_controller.dart';
import '../widgets/transaction_type_tab_bar.dart';
import '../widgets/money_to_receive_screen.dart';

class MoneyScreen extends StatelessWidget {
  const MoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: getWidth(15)),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.close, size: getSp(25)),
          ),
        ),
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
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomCenter,
            stops: [0.1, 0.2, 0.7, 1.5],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getHeight(80)),
              TransactionTypeTabBar(onTabChange: controller.selectTab),
              10.h.verticalSpace,
              Obx(() {
                switch (controller.selectedTab.value) {
                  case 0:
                    return const MoneyToReceiveScreen();
                  case 1:
                    return const TransactionFormScreen();
                  default:
                    return const SizedBox();
                }
              }),
            ],
          ),
        ),
      ),
    );
  }
}
