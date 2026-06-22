import 'package:get/get.dart';
import '../controller/transaction_view_controller.dart';

class TransactionViewBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut<TransactionViewController>(() => TransactionViewController());
  }
}
