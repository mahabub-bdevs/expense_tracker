import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/features/insightStatistics/controller/income_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'detail_input_card.dart';

class MoneyToReceiveScreen extends StatelessWidget {
  const MoneyToReceiveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final incomeController = Get.find<IncomeController>();
    return Padding(
      padding: EdgeInsets.only(
        left: getWidth(20),
        right: getWidth(20),
        top: getHeight(15),
      ),
      child: Column(
        children: [
          DetailInputCard(
            title: 'TRANSACTION',
            subtitle: '2:05 p.m. | Sep 01, 2022',
            controller: incomeController.incomeTransactionClt,
          ),
          DetailInputCard(
            title: 'AMOUNT',
            subtitle: 'Enter Amount',
            controller: incomeController.receivedAmountController,
          ),
          DetailInputCard(
            title: 'CURRENCY',
            subtitle: 'Enter Currency',
            controller: incomeController.incomeCurrentlyClt,
          ),
          DetailInputCard(
            controller: incomeController.incomeRelationClt,
            title: 'RELATION ',
            subtitle: 'Enter Relation',
          ),
          DetailInputCard(
            title: 'PAYMENT MENTHOD',
            subtitle: 'Enter Payment Menthod',
            controller: incomeController.incomePaymentMethodClt,
          ),
          DetailInputCard(
            title: 'DESCRIPTION',
            subtitle: 'Enter Description',
            controller: incomeController.incomeDescriptionClt,
          ),
          30.h.verticalSpace,
          CustomButton(
            text: "Add Money",
            onPressed: () {
               incomeController.getOnTap();
            },
            color: AppColors.primaryVariantLight,
          ),
          30.h.verticalSpace,
        ],
      ),
    );
  }
}
