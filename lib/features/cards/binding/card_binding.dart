import 'package:expense_tracker/features/cards/controller/card_controller.dart';
import 'package:get/get.dart';

class CardBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CardController>(() => CardController());
    // TODO: implement dependencies
  }
}
