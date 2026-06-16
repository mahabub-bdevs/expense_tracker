import 'package:expense_tracker/routes/app_routes.dart';
import 'package:get/get.dart';
import '../../../core/storage/storage_service.dart';

class SplashController extends GetxController {

  @override
  void onInit() {
    super.onInit();
    _navigateToNextScreen();
  }

  Future<void> _navigateToNextScreen() async {
    // Standard delay for splash screen visibility
     await Future.delayed(const Duration(seconds: 5),(){
       Get.toNamed(AppRoutes.main);
     });
    //
    // final token = await _storageService.getAccessToken();
    // final hasOnboarded = _storageService.hasOnboarded();
    //
    // if (token != null && token.isNotEmpty) {
    //   Get.offAllNamed(AppRoutes.main);
    // } else {
    //   if (hasOnboarded) {
    //     Get.offAllNamed(AppRoutes.main);
    //   } else {
    //     Get.offAllNamed(AppRoutes.onboarding);
    //   }
    // }
  }
}
