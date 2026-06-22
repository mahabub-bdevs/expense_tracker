import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/core/utils/app_icons.dart';
import 'package:expense_tracker/core/widgets/custom_animation_text.dart';
import 'package:expense_tracker/features/home/controller/home_controller.dart';
import 'package:expense_tracker/features/profile/controller/profile_controller.dart';
import 'package:expense_tracker/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/circular_percentage_indicator.dart';
import '../widgets/drawer_information_item.dart';
import '../widgets/sidebar_tile_item.dart';
import '../widgets/today_bar_chart.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final profileController = Get.put(ProfileController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(text: "WellCome", fontSize: getSp(12)),
      ),
      drawer: Padding(
        padding: EdgeInsets.only(top: getHeight(100)),
        child: Drawer(
          backgroundColor: AppColors.exBg2,
          width: 400,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Obx(
                  () => DrawerInformationItem(
                    onEditeTap: () {
                      Get.toNamed(AppRoutes.profileInputItem);
                    },
                    name: profileController.nameClt.text.trim(),
                    description: profileController.descriptionClt.text.trim(),
                    image: profileController.imagePath.value,
                  ),
                ),
                18.h.verticalSpace,
                Divider(
                  color: AppColors.backgroundLight.withValues(alpha: 0.3),
                  height: 8,
                ),
                const SidebarTileItem(
                  imagePath: IconPath.shippingBoxIcon,
                  name: 'Get Premium',
                ),
                18.h.verticalSpace,
                Divider(
                  color: AppColors.backgroundLight.withValues(alpha: 0.3),
                  height: 8,
                ),
                const SidebarTileItem(
                  imagePath: IconPath.recordsIcon,
                  name: 'Records',
                ),
                const SidebarTileItem(
                  imagePath: IconPath.bankIcon,
                  name: 'Bank Sync',
                ),
                const SidebarTileItem(
                  imagePath: IconPath.importIcon,
                  name: 'Import',
                ),
                SidebarTileItem(
                  onTap: () {
                    Get.toNamed(AppRoutes.moneyViewScreen);
                  },
                  imagePath: IconPath.invoicePaperIcon,
                  name: 'Add Money',
                ),
                SidebarTileItem(
                  onTap: () {
                    Get.toNamed(AppRoutes.transaction);
                  },
                  imagePath: IconPath.priceTagIcon,
                  name: 'My Transactions',
                ),
                SidebarTileItem(
                  onTap: () {
                    Get.toNamed(AppRoutes.cardViewScreen);
                  },
                  imagePath: IconPath.balanceIcon,
                  name: 'Cards',
                ),
                const SidebarTileItem(
                  imagePath: IconPath.addCircleIcon,
                  name: 'Set Budget',
                ),
                const SidebarTileItem(imagePath: IconPath.cvvIcon, name: 'CVV'),
                const SidebarTileItem(
                  imagePath: IconPath.todoIcon,
                  name: 'Lists',
                ),
                const SidebarTileItem(
                  imagePath: IconPath.settingIcon,
                  name: 'Settings',
                ),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.exBg3, AppColors.exBg2, AppColors.exBg1],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomEnd,
            stops: [0.0, 0.4, 1.5],
          ),
        ),
        child: Column(
          children: [
            SizedBox(height: getHeight(130)),
            CustomAnimationText(
              index: 1,
              baseDuration: 1130,
              child: CustomText(
                text: "Available Balance",
                fontSize: getSp(13),
                color: AppColors.warningDark,
              ),
            ),
            4.h.verticalSpace,
            Obx(() {
              final data = controller.availableBalance.value;
              return CustomAnimationText(
                index: 1,
                baseDuration: 1350,
                beginOffset: const Offset(-5, 0),
                child: CustomText(
                  text: controller.isMinus.value
                      ? "- ৳ ${data.abs().toStringAsFixed(2)}"
                      : "৳ ${data.toStringAsFixed(2)}",
                ),
              );
            }),
            80.h.verticalSpace,
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  CustomAnimationText(
                    index: 1,
                    staggerDelay: 300,
                    baseDuration: 1900,
                    child: Container(
                      height: double.infinity,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(getRadius(20)),
                        color: AppColors.exBg1.withValues(alpha: 0.4),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.backgroundLight.withValues(
                              alpha: 0.05,
                            ),
                            blurStyle: BlurStyle.inner,
                            blurRadius: 5.0,
                            offset: const Offset(0, 10),
                            spreadRadius: 5.0,
                          ),
                        ],
                      ),
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Padding(
                          padding: EdgeInsets.only(
                            top: getHeight(110),
                            left: getWidth(25),
                            right: getWidth(25),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                text: "Today Chart",
                                fontSize: getSp(14),
                                color: AppColors.warningDark,
                              ),
                              20.h.verticalSpace,
                              Obx(
                                () => TodayBarChart(
                                  data: controller.todayChartData.value,
                                  height: 250,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    top: -80,
                    right: 50,
                    child: CustomAnimationText(
                      index: 1,
                      baseDuration: 1500,
                      beginOffset: const Offset(2, 4),
                      child: Column(
                        children: [
                          Container(
                            height: getHeight(120),
                            width: getWidth(120),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.exBg3.withValues(alpha: 0.1),
                                  AppColors.exBg1,
                                ],
                                end: AlignmentGeometry.bottomEnd,
                                begin: AlignmentGeometry.topCenter,
                                stops: const [0.0, 0.5],
                              ),
                            ),
                            child: Obx(
                              () => CircularPercentageIndicator(
                                percentage: controller.incomePercent.value,
                                size: 120,
                                backgroundColor: AppColors.exBg1,
                                fontColor: AppColors.warningDark,
                                fontSize: getSp(15),
                                strokeWidth: 15,
                              ),
                            ),
                          ),
                          CustomText(
                            text: "Income",
                            fontSize: getSp(13),
                            color: AppColors.backgroundLight,
                            fontWeight: FontWeight.w800,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -80,
                    left: 50,
                    child: CustomAnimationText(
                      index: 1,
                      baseDuration: 1500,
                      child: Column(
                        children: [
                          Container(
                            height: getHeight(120),
                            width: getWidth(120),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  AppColors.exBg3.withValues(alpha: 0.1),
                                  AppColors.exBg1,
                                ],
                                end: AlignmentGeometry.bottomEnd,
                                begin: AlignmentGeometry.topCenter,
                                stops: const [0.0, 0.5],
                              ),
                            ),
                            child: Obx(
                              () => CircularPercentageIndicator(
                                percentage: controller.expensePercent.value,
                                size: 120,
                                backgroundColor: AppColors.exBg1,
                                fontColor: AppColors.warningDark,
                                fontSize: getSp(15),
                                strokeWidth: 15,
                              ),
                            ),
                          ),
                          CustomText(
                            text: "Expense",
                            fontSize: getSp(13),
                            color: AppColors.backgroundLight,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
