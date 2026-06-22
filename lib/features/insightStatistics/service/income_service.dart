import 'package:hive/hive.dart';

import '../model/add_money_model.dart';

class IncomeService {
  final Box<AddMoneyModel> _box = Hive.box<AddMoneyModel>('income_box');

  Future<void> addIncome(AddMoneyModel income) async {
    await _box.add(income);
  }

  List<AddMoneyModel> getAllIncome() {
    return _box.values.toList();
  }

  Future<void> deleteIncome(int index) async {
    await _box.deleteAt(index);
  }

  Future<void> updateIncome(int index, AddMoneyModel income) async {
    final key = _box.keyAt(index);
    await _box.putAt(key, income);
  }
}
