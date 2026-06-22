import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../../insightStatistics/service/expense_service.dart';
import '../../insightStatistics/service/income_service.dart';

class HomeController extends GetxController {
  final IncomeService _incomeService = IncomeService();
  final ExpenseService _expenseService = ExpenseService();
  Rx<List<Map<String, dynamic>>> todayChartData =
      Rx<List<Map<String, dynamic>>>([]);

  RxDouble availableBalance = 0.0.obs;
  RxBool isMinus = false.obs;

  RxDouble incomePercent = 0.0.obs;
  RxDouble expensePercent = 0.0.obs;

  @override
  void onInit() {
    super.onInit();
    loadBalance();
    loadChartData();
    loadTodayChart();
  }

  void loadBalance() {
    final incomeList = _incomeService.getAllIncome();
    final expenseList = _expenseService.getAllExpense();

    final totalIncome = incomeList.fold(
      0.0,
      (sum, item) => sum + (double.tryParse(item.amount) ?? 0.0),
    );

    final totalExpense = expenseList.fold(
      0.0,
      (sum, item) => sum + (double.tryParse(item.amount) ?? 0.0),
    );

    availableBalance.value = totalIncome - totalExpense;
    isMinus.value = availableBalance.value < 0;
  }

  void loadChartData() {
    final incomeList = _incomeService.getAllIncome();
    final expenseList = _expenseService.getAllExpense();

    double totalIncome = incomeList
        .map((e) => double.tryParse(e.amount) ?? 0)
        .fold(0, (a, b) => a + b);

    double totalExpense = expenseList
        .map((e) => double.tryParse(e.amount) ?? 0)
        .fold(0, (a, b) => a + b);

    double total = totalIncome + totalExpense;

    if (total > 0) {
      incomePercent.value = (totalIncome / total) * 100;
      expensePercent.value = (totalExpense / total) * 100;
    } else {
      incomePercent.value = 0;
      expensePercent.value = 0;
    }
  }

  void loadTodayChart() {
    final today = DateTime.now();
    final incomeList = _incomeService.getAllIncome();
    final expenseList = _expenseService.getAllExpense();

    final todayIncome = incomeList.where((e) {
      return e.date.contains(DateFormat('dd-MM-yy').format(today));
    }).toList();

    final todayExpense = expenseList.where((e) {
      return e.date.contains(DateFormat('dd-MM-yy').format(today));
    }).toList();

    List<Map<String, dynamic>> data = [];

    for (int i = 0; i < todayIncome.length; i++) {
      data.add({
        "x": i.toDouble(),
        "income": double.tryParse(todayIncome[i].amount) ?? 0,
        "expense": 0.0,
      });
    }

    for (int i = 0; i < todayExpense.length; i++) {
      if (i < data.length) {
        data[i]["expense"] = double.tryParse(todayExpense[i].amount) ?? 0;
      } else {
        data.add({
          "x": i.toDouble(),
          "income": 0.0,
          "expense": double.tryParse(todayExpense[i].amount) ?? 0,
        });
      }
    }

    todayChartData.value = data;
  }
}
