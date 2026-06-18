import 'package:expense_tracker/features/insightStatistics/controller/transaction_controller.dart';
import 'package:get/get.dart';
import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<TransactionController>(()=>TransactionController());
  }
}
