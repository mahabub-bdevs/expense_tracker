import 'package:expense_tracker/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TransactionDetailsScreen extends StatelessWidget {
  const TransactionDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final args = Get.arguments as Map<String, dynamic>?;

    final transactionData = args?['data'];
    final controller = args?['controller'];
    final index = args?['index'];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {
              if (controller != null && index != null) {
                controller.expanseDeleted(index);
              }
            },
            icon: Icon(Icons.delete, size: getSp(20)),
          ),
          SizedBox(width: getWidth(10)),
        ],
        leading: Padding(
          padding: EdgeInsets.only(left: getWidth(20)),
          child: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(Icons.arrow_back_ios, size: getSp(25)),
          ),
        ),
        title: CustomText(text: transactionData.category, fontSize: getSp(14)),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [AppColors.exBg3, AppColors.exBg2, AppColors.exBg3],
            stops: [0.1, 0.3, 1.3],
            end: AlignmentGeometry.bottomCenter,
            begin: AlignmentGeometry.topRight,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(left: getWidth(20), right: getWidth(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              80.h.verticalSpace,
              TextFormate(name: 'Id ', value: transactionData.id.toString()),
              5.h.verticalSpace,
              TextFormate(name: 'Category', value: transactionData.category),
              5.h.verticalSpace,
              TextFormate(name: "Relation ", value: transactionData.relation),
              5.h.verticalSpace,
              TextFormate(name: "Currently ", value: transactionData.currency),
              5.h.verticalSpace,
              TextFormate(
                name: "payment Methode ",
                value: transactionData.paymentMethode,
              ),
              5.h.verticalSpace,
              TextFormate(name: "Amount ", value: transactionData.amount),
              5.h.verticalSpace,
              TextFormate(
                name: "Description ",
                value: transactionData.description,
              ),
              5.h.verticalSpace,
              TextFormate(name: "Transaction ", value: transactionData.title),
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
