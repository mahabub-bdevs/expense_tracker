import 'package:expense_tracker/features/cards/model/card_model.dart';
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
  Hive.registerAdapter(CardModelAdapter());
  await Hive.openBox<ExpenseModel>('expense');
  await Hive.openBox<AddMoneyModel>('income_box');
  await Hive.openBox<CardModel>('card');
  await Hive.openBox('profile');
  runApp(const MyApp());
}
