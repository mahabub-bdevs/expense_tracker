import 'package:expense_tracker/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../controller/transaction_controller.dart';
import 'detail_input_card.dart';

class TransactionFormScreen extends StatelessWidget {
  const TransactionFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<TransactionController>();
    return Padding(
      padding: EdgeInsets.only(
        left: getWidth(20),
        right: getWidth(20),
        top: getHeight(15),
      ),
      child: Column(
        children: [
          DetailInputCard(
            controller: controller.transactionClt,
            title: 'TRANSACTION ',
            subtitle: '2:05 p.m.   |   Sep 01, 2022',
          ),
          DetailInputCard(
            controller: controller.categoryClt,
            title: 'CATEGORY ',
            subtitle: 'Enter Category',
          ),
          DetailInputCard(
            controller: controller.receivedAmountController,
            title: 'AMOUNT ',
            subtitle: 'Enter Amount',
          ),
          DetailInputCard(
            controller: controller.relationClt,
            title: 'RELATION ',
            subtitle: 'Enter Relation',
          ),
          DetailInputCard(
            controller: controller.currentlyClt,
            title: 'CURRENCY ',
            subtitle: 'Enter Currency',
          ),
          DetailInputCard(
            controller: controller.paymentMethodClt,
            title: 'PAYMENT MENTHOD ',
            subtitle: 'Enter Payment Menthod',
          ),
          DetailInputCard(
            controller: controller.descriptionClt,
            maxLine: 4,
            title: 'DESCRIPTION ',
            subtitle: 'Enter Description',
          ),
          30.h.verticalSpace,
          CustomButton(
            text: "Send Money",
            onPressed: () {
              controller.getOnTap();
            },
            color: AppColors.exBg1,
          ),
          30.h.verticalSpace,
        ],
      ),
    );
  }
}
