import 'package:expense_tracker/features/insightStatistics/model/expense_model.dart';
import 'package:expense_tracker/features/insightStatistics/service/expense_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../home/controller/home_controller.dart';

class TransactionController extends GetxController {
  final ExpenseService _expenseService = ExpenseService();

  final transactionClt = TextEditingController();
  final categoryClt = TextEditingController();
  final amountClt = TextEditingController();
  final relationClt = TextEditingController();
  final currentlyClt = TextEditingController();
  final paymentMethodClt = TextEditingController();
  final descriptionClt = TextEditingController();
  final RxList<ExpenseModel> expenseData = <ExpenseModel>[].obs;
  final int id = 0;

  final homeController = Get.find<HomeController>();

  final receivedAmountController = TextEditingController();

  RxInt selectedTab = 0.obs;
  void selectTab(int index) => selectedTab.value = index;

  @override
  void onInit() {
    super.onInit();

    if (Get.arguments != null) {
      receivedAmountController.text = Get.arguments as String;
    }

    expenseList();
  }

  Future<void> expenseList() async {
    expenseData.value = _expenseService.getAllExpense();
  }

  Future<void> getOnTap() async {
    if (transactionClt.text.isNotEmpty &&
        categoryClt.text.isNotEmpty &&
        relationClt.text.isNotEmpty &&
        currentlyClt.text.isNotEmpty &&
        paymentMethodClt.text.isNotEmpty &&
        descriptionClt.text.isNotEmpty &&
        receivedAmountController.text.isNotEmpty) {
      final String formattedDate = DateFormat(
        'hh:mm a, dd-MM-yy',
      ).format(DateTime.now());
      final newExpense = ExpenseModel(
        title: transactionClt.text.trim(),
        category: categoryClt.text.trim(),
        date: formattedDate,
        amount: receivedAmountController.text.trim(),
        currency: currentlyClt.text.trim(),
        isExpense: true,
        id: DateTime.now().millisecondsSinceEpoch,
        relation: relationClt.text.trim(),
        description: descriptionClt.text.trim(),
        paymentMethode: paymentMethodClt.text.trim(),
      );

      await _expenseService.addExpense(newExpense);
      await expenseList();
      homeController.loadBalance();
      homeController.loadChartData();
      homeController.loadTodayChart();
      Get.snackbar("সফল!", "ডাটা সেভ হয়েছে");
      clearExpenseFields();
    } else {
      Get.snackbar("এরর", "অনুগ্রহপূর্বক ফরমটি পূরণ করুন");
    }
  }

  Future<void> expanseDeleted(int expenseId) async {
    try {
      await _expenseService.deleteExpense(expenseId);
      await expenseList();
      homeController.loadBalance();
      homeController.loadChartData();
      homeController.loadTodayChart();
      Get.back();
      Get.snackbar(
        "সফল!",
        "এক্সপেন্সটি সফলভাবে ডিলিট করা হয়েছে।",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "এরর!",
        "ডিলিট করা যায়নি: $e",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  void clearExpenseFields() {
    transactionClt.clear();
    categoryClt.clear();
    receivedAmountController.clear();
    relationClt.clear();
    currentlyClt.clear();
    paymentMethodClt.clear();
    descriptionClt.clear();
  }
}
