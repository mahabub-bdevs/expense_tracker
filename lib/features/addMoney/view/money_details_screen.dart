import 'package:expense_tracker/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MoneyDetailsScreen extends StatelessWidget {
  const MoneyDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>;
    final controller = args["controller"];
    final data = args["data"];
    final index = args['index'];
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,

        title: CustomText(
          text: data.relation,
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
        actions: [
          IconButton(
            onPressed: () {
              controller.getIncomeDeleted(index);
            },
            icon: Icon(Icons.delete, size: getSp(20)),
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
              AppColors.exBg3,
              AppColors.exBg2,
              AppColors.exBg1,
              AppColors.exBg3,
            ],
            end: AlignmentGeometry.bottomCenter,
            begin: AlignmentGeometry.topLeft,
            stops: [0.0, 0.0, 0.2, 0.4, 1.5],
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: getWidth(15), right: getWidth(20)),
          child: Column(
            children: [
              SizedBox(height: getHeight(80)),
              TextFormate(name: "Relation", value: data.relation),
              5.h.verticalSpace,
              TextFormate(name: "Currently", value: data.currency),
              5.h.verticalSpace,
              TextFormate(name: "Payment Method", value: data.paymentMethod),
              5.h.verticalSpace,
              TextFormate(name: "Amount", value: data.amount),
              5.h.verticalSpace,
              TextFormate(name: "Description", value: data.description),
              5.h.verticalSpace,
              TextFormate(name: "Transaction", value: data.transaction),
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
