import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';

class InsightController extends GetxController {
  final TextEditingController amountController = TextEditingController();

  void addBalanceBottom() {
    if (amountController.text.isNotEmpty) {
      double? amount = double.tryParse(amountController.text);

      if (amount != null && amount >= 5) {
        Get.toNamed(AppRoutes.money, arguments: amountController.text);
      } else {
        Get.snackbar(
          'ভুল অ্যামাউন্ট',
          'অনুগ্রহ করে সর্বনিম্ন ৫ টাকা বা তার বেশি ইনপুট দিন।',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    } else {
      Get.snackbar(
        'খালি ফিল্ড',
        'অনুগ্রহ করে একটি অ্যামাউন্ট লিখুন।',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void onKeyTap(String key) {
    if (key == '.' && amountController.text.contains('.')) return;
    final current = amountController.text;
    amountController.text = current + key;
    _moveCursorToEnd();
  }

  void onBackspace() {
    final current = amountController.text;
    if (current.isEmpty) return;
    amountController.text = current.substring(0, current.length - 1);
    _moveCursorToEnd();
  }

  void _moveCursorToEnd() {
    amountController.selection = TextSelection.fromPosition(
      TextPosition(offset: amountController.text.length),
    );
  }

  @override
  void onClose() {
    amountController.dispose();
    super.onClose();
  }
}
