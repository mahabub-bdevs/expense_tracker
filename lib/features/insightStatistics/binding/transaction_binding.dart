import 'package:expense_tracker/features/insightStatistics/controller/income_controller.dart';
import 'package:get/get.dart';
import '../controller/transaction_controller.dart';

class TransactionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionController>(() => TransactionController());
    Get.lazyPut<IncomeController>(() => IncomeController());
  }
}
