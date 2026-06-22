import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/features/cards/view/update_alart_dilog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/widgets/show_custom_dialog.dart';

class CardDetailsScreen extends StatelessWidget {
  const CardDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final controller = args["controller"];
    final data = args["data"];
    final index = args['index'];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: Padding(
          padding: EdgeInsets.only(left: getWidth(15)),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              size: getSp(24),
              color: AppColors.backgroundLight,
            ),
          ),
        ),
        title: CustomText(
          text: data.cardHolderName,
          fontSize: getSp(11),
          color: AppColors.backgroundLight,
        ),
        actions: [
          IconButton(
            onPressed: () {
              controller.prefillCard(data);
              showUpdateDialog(
                context,
                controller.cardNumberClt,
                controller.expirationClt,
                controller.cardTypeClt,
                controller.securityCodeClt,
                controller.balanceClt,
                controller.cardHolderClt,
                () {
                  controller.getUpdate(index);
                },
              );
            },
            icon: Icon(
              Icons.edit_outlined,
              size: getSp(20),
              color: AppColors.backgroundLight,
            ),
          ),
          IconButton(
            onPressed: () {
              showCustomDialog(
                context,
                () {
                  if (controller != null && index != null) {
                    controller.getDeleted(index);
                  }
                },
                "হ্যাঁ",
                "না",
                "মুছে ফেলতে চান?",
                "আপনি কি নিশ্চিত যে আপনি এই কার্ড ডিলিট করতে চান? এটি আর ফিরিয়ে আনা যাবে না।",
                data.cardHolderName,
              );
            },
            icon: Icon(
              Icons.delete_rounded,
              size: getSp(24),
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
            stops: [0.0, 0.4, 0.9, 1.5],
            begin: AlignmentGeometry.topLeft,
            end: AlignmentGeometry.bottomCenter,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: getWidth(15), right: getWidth(15)),
          child: Column(
            children: [
              SizedBox(height: getHeight(80)),
              TextFormate(name: "ID", value: index.toString()),
              10.h.verticalSpace,
              TextFormate(name: "Card Holder Name", value: data.cardHolderName),
              10.h.verticalSpace,
              TextFormate(name: "Card Number", value: data.cardNumber),
              10.h.verticalSpace,
              TextFormate(name: "Expiry Date", value: data.expiryDate),
              10.h.verticalSpace,
              TextFormate(name: "Card Type", value: data.cardType),
              10.h.verticalSpace,
              TextFormate(name: "Security Code", value: data.securityCode),
              10.h.verticalSpace,
              TextFormate(name: "Balance", value: data.balance),
              10.h.verticalSpace,
            ],
          ),
        ),
      ),
    );
  }
}

class TextFormate extends StatelessWidget {
  final String name;
  final String value;
  const TextFormate({super.key, required this.name, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.only(
        left: getWidth(10),
        right: getWidth(10),
        top: getHeight(8),
        bottom: getHeight(8),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getRadius(10)),
        border: BoxBorder.all(color: AppColors.warningDark, width: 1),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: "$name ",
                color: AppColors.warningDark,
                fontSize: getSp(13),
              ),
              10.w.horizontalSpace,
              SizedBox(
                height: getHeight(20),
                child: const VerticalDivider(
                  color: AppColors.warningDark,
                  width: 4,
                  thickness: 2.0,
                ),
              ),
              10.w.horizontalSpace,
              Expanded(
                child: CustomText(text: value, fontSize: getSp(11)),
              ),
            ],
          ),
          //  Divider(color: AppColors.borderLight),
        ],
      ),
    );
  }
}
