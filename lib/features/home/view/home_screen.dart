import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/core/utils/app_icons.dart';
import 'package:expense_tracker/features/home/controller/home_controller.dart';
import 'package:expense_tracker/features/insightStatistics/controller/transaction_controller.dart';
import 'package:expense_tracker/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../widgets/circular_percentage_indicator.dart';
import '../widgets/drawer_information_item.dart';
import '../widgets/empty_data_item.dart';
import '../widgets/sidebar_tile_item.dart';
import '../widgets/transaction_tile_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final expanseController = Get.put(TransactionController());
    final controller = Get.find<HomeController>();
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
          child: Column(
            children: [
              const DrawerInformationItem(
                name: 'Md Mahabub Alam',
                description: 'Flutter Developer',
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
              SidebarTileItem(
                onTap: () {
                  Get.toNamed(AppRoutes.moneyViewScreen);
                },
                imagePath: IconPath.importIcon,
                name: 'Import',
              ),
              const SidebarTileItem(
                imagePath: IconPath.invoicePaperIcon,
                name: 'Receipts',
              ),
              const SidebarTileItem(
                imagePath: IconPath.priceTagIcon,
                name: 'Tags',
              ),
              const SidebarTileItem(
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
            CustomText(
              text: "Available Balance",
              fontSize: getSp(13),
              color: AppColors.warningDark,
            ),
            4.h.verticalSpace,
            Obx(() {
              final data = controller.availableBalance.value;
              return CustomText(
                text: controller.isMinus.value
                    ? "- ৳ ${data.abs().toStringAsFixed(2)}"
                    : "৳ ${data.toStringAsFixed(2)}",
              );
            }),
            80.h.verticalSpace,
            Expanded(
              child: Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
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
                    child: Padding(
                      padding: EdgeInsets.only(top: getHeight(80), left: 25),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomText(text: "My transactions"),
                          15.h.verticalSpace,
                          Expanded(
                            child: Obx(() {
                              if (expanseController.expenseData.isEmpty) {
                                return const Center(child: EmptyDataItem());
                              }
                              return ListView.separated(
                                padding: EdgeInsets.zero,
                                separatorBuilder: (context, index) {
                                  return SizedBox(height: getHeight(10));
                                },
                                itemCount: expanseController.expenseData.length,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  final data =
                                      expanseController.expenseData[index];
                                  return TransactionTileItem(
                                    onTap: () {
                                      Get.toNamed(
                                        AppRoutes.transactionDetailsScreen,
                                        arguments: {
                                          "data": data,
                                          "controller": expanseController,
                                          "index": index,
                                        },
                                      );
                                    },
                                    title: data.category,
                                    subTitle: data.date,
                                    balance: data.amount.toString(),
                                    iconPath: data.category[0],
                                    boxColor: AppColors.primaryVariantLight,
                                  );
                                },
                              );
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: -80,
                    right: 50,
                    child: Container(
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
                      child: CircularPercentageIndicator(
                        percentage: 40,
                        size: 120,
                        backgroundColor: AppColors.exBg1,
                        fontColor: AppColors.warningDark,
                        fontSize: getSp(15),
                        strokeWidth: 15,
                      ),
                    ),
                  ),
                  Positioned(
                    top: -80,
                    left: 50,
                    child: Container(
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
                      child: CircularPercentageIndicator(
                        percentage: 50,
                        size: 120,
                        backgroundColor: AppColors.exBg1,
                        fontColor: AppColors.warningDark,
                        fontSize: getSp(15),
                        strokeWidth: 15,
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
