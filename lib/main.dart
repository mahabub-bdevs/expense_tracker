import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'app.dart';
import 'core/storage/storage_service.dart';
import 'features/insightStatistics/model/add_money_model.dart';
import 'features/insightStatistics/model/expense_model.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await SystemChrome.setPreferredOrientations([]);

  Get.put<StorageService>(StorageService(), permanent: true);
  await Hive.initFlutter();
  Hive.registerAdapter(ExpenseModelAdapter());
  Hive.registerAdapter(AddMoneyModelAdapter());
  await Hive.openBox<ExpenseModel>('expense');
  await Hive.openBox<AddMoneyModel>('income_box');
  runApp(
    // DevicePreview(
    //   // Set to false in production; true during development to preview layouts.
    //   enabled: true,
    //   builder: (context) =>
    const MyApp(),
    // ),
  );
}
