import 'package:get/get.dart';

import '../../insightStatistics/service/expense_service.dart';
import '../../insightStatistics/service/income_service.dart';

class HomeController extends GetxController {
  final IncomeService _incomeService = IncomeService();
  final ExpenseService _expenseService = ExpenseService();

  RxDouble availableBalance = 0.0.obs;
  RxBool isMinus = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadBalance();
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
}
