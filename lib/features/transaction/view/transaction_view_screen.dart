import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/core/widgets/custom_animation_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../routes/app_routes.dart';
import '../controller/transaction_view_controller.dart';
import '../widgets/empty_data_item.dart';
import '../widgets/transaction_tile_item.dart';
import '../../insightStatistics/controller/transaction_controller.dart';

class TransactionViewScreen extends StatelessWidget {
  const TransactionViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final expanseController = Get.put(TransactionController());
    final controller = Get.find<TransactionViewController>();
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
            icon: Icon(
              Icons.arrow_back_ios,
              size: getSp(25),
              color: AppColors.backgroundLight,
            ),
          ),
        ),
        title: Obx(
          () => controller.isSearch.value
              ? TextFormField(
                  decoration: const InputDecoration(hintText: "Search"),
                )
              : CustomText(
                  text: "My Transaction",
                  fontSize: getSp(12),
                  color: AppColors.backgroundLight,
                  fontWeight: FontWeight.w800,
                ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.isSearch.value = !controller.isSearch.value;
            },
            icon: Icon(
              Icons.search,
              size: getSp(25),
              color: AppColors.backgroundLight,
            ),
          ),
          SizedBox(width: getWidth(10)),
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
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getHeight(100)),
              Padding(
                padding: EdgeInsets.only(
                  left: getWidth(20),
                  right: getWidth(5),
                  top: getHeight(10),
                ),
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
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final data = expanseController.expenseData[index];
                      return CustomAnimationText(
                        index: index,
                        staggerDelay: 250,beginOffset:const Offset(1, -8),
                        child: TransactionTileItem(
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
                        ),
                      );
                    },
                  );
                }),
              ),
              SizedBox(height: getHeight(30)),
            ],
          ),
        ),
      ),
    );
  }
}
