import 'package:expense_tracker/features/addMoney/binding/money_binding.dart';
import 'package:expense_tracker/features/addMoney/view/money_details_screen.dart';
import 'package:expense_tracker/features/cards/binding/card_binding.dart';
import 'package:expense_tracker/features/cards/view/card_screen.dart';
import 'package:expense_tracker/features/home/view/transaction_details_screen.dart';
import 'package:expense_tracker/features/insightStatistics/binding/insight_binding.dart';
import 'package:expense_tracker/features/insightStatistics/view/add_balance_screen.dart';
import 'package:expense_tracker/features/insightStatistics/view/money_screen.dart';
import 'package:expense_tracker/features/insightStatistics/widgets/money_to_receive_screen.dart';
import 'package:expense_tracker/features/insightStatistics/widgets/transaction_form_screen.dart';
import 'package:get/get.dart';
import '../features/addMoney/view/money_view_screen.dart';
import '../features/insightStatistics/binding/transaction_binding.dart';
import 'app_routes.dart';

import '../features/splash/view/splash_screen.dart';
import '../features/splash/binding/splash_binding.dart';
import '../features/onboarding/view/onboarding_screen.dart';
import '../features/onboarding/binding/onboarding_binding.dart';
import '../features/main/view/main_screen.dart';
import '../features/main/binding/main_binding.dart';
import '../features/home/view/home_screen.dart';
import '../features/home/binding/home_binding.dart';

class AppPages {
  static final routes = [
    GetPage(
      name: AppRoutes.splash,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: AppRoutes.onboarding,
      page: () => const OnboardingScreen(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: AppRoutes.main,
      page: () => const MainScreen(),
      binding: MainBinding(),
    ),
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.transactionDetailsScreen,
      page: () => const TransactionDetailsScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.card,
      page: () => const CardScreen(),
      binding: CardBinding(),
    ),
    GetPage(
      name: AppRoutes.insightStatistics,
      page: () => const AddBalanceScreen(),
      binding: InsightBinding(),
    ),
    GetPage(
      name: AppRoutes.money,
      page: () => const MoneyScreen(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: AppRoutes.transactionFormScreen,
      page: () => const TransactionFormScreen(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: AppRoutes.moneyToReceiveScreen,
      page: () => const MoneyToReceiveScreen(),
      binding: TransactionBinding(),
    ),
    GetPage(
      name: AppRoutes.moneyViewScreen,
      page: () => const MoneyViewScreen(),
      binding: MoneyBinding(),
    ),
    GetPage(
      name: AppRoutes.moneyDetailsScreen,
      page: () => const MoneyDetailsScreen(),
      binding: MoneyBinding(),
    ),
  ];
}
