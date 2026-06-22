import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/core/widgets/custom_animation_text.dart';
import 'package:expense_tracker/features/cards/controller/card_controller.dart';
import 'package:expense_tracker/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../transaction/widgets/empty_data_item.dart';
import '../../transaction/widgets/transaction_tile_item.dart';

class CardViewScreen extends StatelessWidget {
  const CardViewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CardController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: getWidth(10)),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: getSp(22),
              color: AppColors.backgroundLight,
            ),
          ),
        ),
        title: CustomText(
          text: "Card View",
          fontSize: getSp(12),
          color: AppColors.backgroundLight,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              size: getSp(22),
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
              AppColors.exBg2,
              AppColors.exBg1,
              AppColors.exBg3,
            ],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomCenter,
            stops: [0.1, 0.6, 0.9, 1.5],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: getWidth(20), right: getWidth(5)),
          child: Column(
            children: [
              Expanded(
                child: Obx(() {
                  if (controller.cardData.isEmpty) {
                    return const Center(child: EmptyDataItem());
                  }
                  return ListView.separated(
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 10);
                    },
                    shrinkWrap: true,
                    itemCount: controller.cardData.length,
                    itemBuilder: (context, index) {
                      final data = controller.cardData[index];
                      return CustomAnimationText(
                        beginOffset: const Offset(5, 0),
                        baseDuration: 800,
                        staggerDelay: 400,
                        index: index,
                        child: TransactionTileItem(
                          onTap: () {
                            Get.toNamed(
                              AppRoutes.cardDetailsScreen,
                              arguments: {
                                "controller": controller,
                                "data": data,
                                "index": index,
                              },
                            );
                          },
                          boxColor: AppColors.primaryVariantLight,
                          title: data.cardHolderName,
                          subTitle: data.cardNumber,
                          balance: data.balance,
                          iconPath: index.toString(),
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
