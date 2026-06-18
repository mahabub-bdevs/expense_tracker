import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/features/home/widgets/empty_data_item.dart';
import 'package:expense_tracker/features/insightStatistics/controller/income_controller.dart';
import 'package:expense_tracker/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../home/widgets/transaction_tile_item.dart';

class MoneyViewScreen extends StatelessWidget {
  const MoneyViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(IncomeController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: CustomText(
          text: "Money",
          fontSize: getSp(12),
          color: AppColors.backgroundLight,
        ),
        leading: Padding(
          padding: EdgeInsets.only(left: getWidth(15)),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: getSp(20),
              color: AppColors.backgroundLight,
            ),
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
            end: AlignmentGeometry.bottomCenter,
            begin: AlignmentGeometry.topLeft,
            stops: [0.0, 0.15, 0.5, 1.5],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: getWidth(20), right: getWidth(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: getHeight(80)),
              CustomText(text: "Add Money", fontSize: getSp(14)),
              10.h.verticalSpace,
              Expanded(
                child: Obx(() {
                  if (controller.incomeData.isEmpty) {
                    return const Center(child: EmptyDataItem());
                  }
                  return ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.incomeData.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final data = controller.incomeData[index];
                      return Padding(
                        padding: EdgeInsets.only(top: getHeight(10)),
                        child: TransactionTileItem(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.moneyDetailsScreen,
                              arguments: {
                                "controller": controller,
                                "data": data,
                                "index": index,
                              },
                            );
                          },
                          title: data.relation,
                          subTitle: data.date,
                          balance: data.amount,
                          iconPath: data.relation[0],
                        ),
                      );
                    },
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
