import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/core/utils/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';
import '../widgets/circular_percentage_indicator.dart';
import '../widgets/drawer_information_item.dart';
import '../widgets/sidebar_tile_item.dart';
import '../widgets/transaction_tile_item.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(text: "WellCome", fontSize: getSp(12)),
      ),
      drawer: Padding(
        padding: EdgeInsets.only(top: 100),
        child: Drawer(
          backgroundColor: AppColors.exBg2,
          width: 400,
          child: Column(
            children: [
              DrawerInformationItem(
                name: 'Md Mahabub Alam',
                description: 'Flutter Developer',
              ),
              18.h.verticalSpace,
              Divider(
                color: AppColors.backgroundLight.withValues(alpha: 0.3),
                height: 8,
              ),
              SidebarTileItem(
                imagePath: IconPath.shippingBoxIcon,
                name: 'Get Premium',
              ),
              18.h.verticalSpace,
              Divider(
                color: AppColors.backgroundLight.withValues(alpha: 0.3),
                height: 8,
              ),
              SidebarTileItem(imagePath: IconPath.recordsIcon, name: 'Records'),
              SidebarTileItem(imagePath: IconPath.bankIcon, name: 'Bank Sync'),
              SidebarTileItem(imagePath: IconPath.importIcon, name: 'Import'),
              SidebarTileItem(
                imagePath: IconPath.invoicePaperIcon,
                name: 'Receipts',
              ),
              SidebarTileItem(imagePath: IconPath.priceTagIcon, name: 'Tags'),
              SidebarTileItem(imagePath: IconPath.balanceIcon, name: 'Cards'),
              SidebarTileItem(
                imagePath: IconPath.addCircleIcon,
                name: 'Set Budget',
              ),
              SidebarTileItem(imagePath: IconPath.cvvIcon, name: 'CVV'),
              SidebarTileItem(imagePath: IconPath.todoIcon, name: 'Lists'),
              SidebarTileItem(
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
        decoration: BoxDecoration(
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
            CustomText(
              text: " \$ 25251.00",
              fontSize: getSp(20),
              color: AppColors.backgroundLight,
            ),
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
                          offset: Offset(0, 10),
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
                          CustomText(text: "My transactions"),
                          15.h.verticalSpace,
                          Expanded(
                            child: ListView.separated(
                              padding: EdgeInsets.zero,
                              separatorBuilder: (context, index) {
                                return SizedBox(height: getHeight(10));
                              },
                              itemCount: controller.transferData.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                final data = controller.transferData[index];
                                return TransactionTileItem(
                                  title: data.title,
                                  subTitle: data.date,
                                  balance: data.amount.toString(),
                                  iconPath: data.iconPath,
                                  boxColor: data.itemColor,
                                );
                              },
                            ),
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
                          stops: [0.0, 0.5],
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
                          stops: [0.0, 0.5],
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
