import 'package:expense_tracker/features/cards/controller/card_controller.dart';
import 'package:expense_tracker/features/insightStatistics/controller/insight_controller.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // ─── Core Global Singletons ───────────────────────────────────────────────
    // These are needed throughout the entire fd lifecycle.
    Get.put<CardController>(CardController(), permanent: true);
    Get.put<InsightController>(InsightController(), permanent: true);
  }
}
