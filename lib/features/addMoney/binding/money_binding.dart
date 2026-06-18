import 'package:expense_tracker/features/addMoney/controller/money_controller.dart';
import 'package:get/get.dart';

class MoneyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MoneyController>(() => MoneyController());
  }
}
