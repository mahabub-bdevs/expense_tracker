import 'package:hive/hive.dart';

part 'card_model.g.dart';

@HiveType(typeId: 3)
class CardModel extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String cardNumber;

  @HiveField(2)
  final String cardHolderName;

  @HiveField(3)
  final String balance;

  @HiveField(4)
  final String cardDescription;

  @HiveField(5)
  final String expiryDate;

  @HiveField(6)
  final String cardType;

  @HiveField(7)
  final String securityCode;

  @HiveField(8)
  final bool isActive;

  CardModel({
    required this.id,
    required this.cardNumber,
    required this.cardHolderName,
    required this.balance,
    required this.cardDescription,
    required this.expiryDate,
    required this.cardType,
    this.isActive = true,
    required this.securityCode,
  });
}
