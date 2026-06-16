import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/core/utils/app_icons.dart';
import 'package:expense_tracker/features/home/model/transfication_model.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final RxList<TransficationModel> transferData = <TransficationModel>[].obs;
  @override
  void onInit() {
    // TODO: implement onInit
    transferList();

    super.onInit();
  }

  void transferList() {
    transferData.value = [
      TransficationModel(
        title: "Shell",
        date: "Sep 02, 2022",
        amount: 550,
        iconPath: IconPath.balanceIcon,
        itemColor: AppColors.warningDark,
      ),
      TransficationModel(
        title: "SM Supermart",
        date: "Sep 01, 2022",
        amount: 456,
        iconPath: IconPath.recordsIcon,
        itemColor: AppColors.primaryVariantLight,
      ),
      TransficationModel(
        title: "PinelabsPOS",
        date: "Aug 31, 2022",
        amount: 856,
        iconPath: IconPath.todoIcon,
        itemColor: AppColors.infoDark,
      ),
      TransficationModel(
        title: "AMAZON",
        date: "Aug 31, 2022",
        amount: 5260,
        iconPath: IconPath.invoicePaperIcon,
        itemColor: AppColors.secondaryLight,
      ),
    ];
  }
}
