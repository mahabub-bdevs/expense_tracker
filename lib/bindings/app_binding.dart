import 'package:expense_tracker/features/cards/controller/card_controller.dart';
import 'package:get/get.dart';
import '../core/network/network_caller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // ─── Core Global Singletons ───────────────────────────────────────────────
    // These are needed throughout the entire fd lifecycle.
    Get.put<NetworkCaller>(NetworkCaller(), permanent: true);
    Get.put<CardController>(CardController(), permanent: true);
  }
}
