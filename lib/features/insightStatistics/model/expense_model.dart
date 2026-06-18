import 'package:hive/hive.dart';

part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel extends HiveObject {
  @HiveField(0)
  String title;

  @HiveField(1)
  String date;

  @HiveField(2)
  String amount;

  @HiveField(3)
  String currency;

  @HiveField(4)
  bool isExpense;

  @HiveField(5)
  String? logoUrl;

  @HiveField(6)
  int id;

  @HiveField(7)
  String relation;

  @HiveField(8)
  String description;

  @HiveField(9)
  String paymentMethode;
  @HiveField(10)
  String category;

  ExpenseModel({
    required this.title,
    required this.date,
    required this.amount,
    required this.currency,
    required this.isExpense,
    this.logoUrl,
    required this.id,
    required this.relation,
    required this.description,
    required this.paymentMethode,
    required this.category,
  });
}
