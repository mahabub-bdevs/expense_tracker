import 'package:hive/hive.dart';

part 'add_money_model.g.dart';

@HiveType(typeId: 1)
class AddMoneyModel extends HiveObject {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String transaction;

  @HiveField(2)
  final String amount;

  @HiveField(3)
  final String currency;

  @HiveField(4)
  final String relation;

  @HiveField(5)
  final String paymentMethod;

  @HiveField(6)
  final String description;
  @HiveField(7)
  final String date;
  AddMoneyModel({
    required this.id,
    required this.transaction,
    required this.amount,
    required this.currency,
    required this.relation,
    required this.paymentMethod,
    required this.description,
    required this.date, required

  });
}
