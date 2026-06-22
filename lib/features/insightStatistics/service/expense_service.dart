import 'package:expense_tracker/features/insightStatistics/model/expense_model.dart';
import 'package:hive/hive.dart';

class ExpenseService {
  final Box<ExpenseModel> _box = Hive.box<ExpenseModel>('expense');

  Future<void> addExpense(ExpenseModel expense) async {
    await _box.add(expense);
  }

  List<ExpenseModel> getAllExpense() {
    return _box.values.toList();
  }

  Future<void> deleteExpense(int index) async {
    await _box.deleteAt(index);
  }

  Future<void> updateExpense(int index, ExpenseModel expense) async {
    final key = _box.keyAt(index);
    await _box.putAt(key, expense);
  }
}
