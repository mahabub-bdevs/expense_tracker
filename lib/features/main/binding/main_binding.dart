import 'package:get/get.dart';
import '../controller/main_controller.dart';
import '../../home/controller/home_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MainController>(() => MainController());
    
    // Since Home is a tab within Main, we often put it here or keep it separate.
    // For this template, let's put it here so Home is ready when Main loads.

    Get.lazyPut<HomeController>(() => HomeController());
  }
}
