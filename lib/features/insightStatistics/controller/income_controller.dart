import 'package:expense_tracker/features/home/controller/home_controller.dart';
import 'package:expense_tracker/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../model/add_money_model.dart';
import '../service/income_service.dart';

class IncomeController extends GetxController {
  final receivedAmountController = TextEditingController();
  final incomeTransactionClt = TextEditingController();
  final incomeRelationClt = TextEditingController();
  final incomeCurrentlyClt = TextEditingController();
  final incomePaymentMethodClt = TextEditingController();
  final incomeDescriptionClt = TextEditingController();

  final RxList<AddMoneyModel> incomeData = <AddMoneyModel>[].obs;

  final homeController = Get.find<HomeController>();
  final IncomeService _incomeService = IncomeService();

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      receivedAmountController.text = Get.arguments.toString();
    }
    loadAllIncome();
  }

  Future<void> loadAllIncome() async {
    try {
      incomeData.value = _incomeService.getAllIncome();
    } catch (e) {
      debugPrint("Data load error: $e");
    }
  }

  Future<void> getIncomeDeleted(int index) async {
    try {
      await _incomeService.deleteIncome(index);
      loadAllIncome();
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

  Future<void> getOnTap() async {
    if (incomeTransactionClt.text.isNotEmpty &&
        incomeCurrentlyClt.text.isNotEmpty &&
        incomeRelationClt.text.isNotEmpty &&
        incomeDescriptionClt.text.isNotEmpty &&
        incomePaymentMethodClt.text.isNotEmpty &&
        receivedAmountController.text.isNotEmpty) {
      final String formattedDate = DateFormat(
        'hh:mm a, dd-MM-yy',
      ).format(DateTime.now());

      final newIncome = AddMoneyModel(
        id: DateTime.now().millisecondsSinceEpoch,
        transaction: incomeTransactionClt.text.trim(),
        amount: receivedAmountController.text.trim(),
        currency: incomeCurrentlyClt.text.trim(),
        relation: incomeRelationClt.text.trim(),
        description: incomeDescriptionClt.text.trim(),
        paymentMethod: incomePaymentMethodClt.text.trim(),
        date: formattedDate,
      );

      try {
        await _incomeService.addIncome(newIncome);
        await loadAllIncome();
        clearIncomeFields();
        homeController.loadBalance();
        homeController.loadChartData();
        homeController.loadTodayChart();
        Get.snackbar("সফল!", "ডাটা সেভ হয়েছে");
        await Future.delayed(const Duration(milliseconds: 300));
        Get.offAllNamed(AppRoutes.main);
      } catch (e) {
        Get.snackbar("এরর", "ডাটা সেভ করতে সমস্যা হয়েছে: $e");
      }
    } else {
      Get.snackbar("এরর", "অনুগ্রহপূর্বক ফরমটি পূরণ করুন");
    }
  }

  void clearIncomeFields() {
    incomeTransactionClt.clear();
    incomeCurrentlyClt.clear();
    incomeRelationClt.clear();
    incomeDescriptionClt.clear();
    incomePaymentMethodClt.clear();
    receivedAmountController.clear();
  }
}
