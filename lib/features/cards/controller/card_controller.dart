import 'package:expense_tracker/features/cards/model/card_model.dart';
import 'package:expense_tracker/features/cards/service/card_service.dart';
import 'package:expense_tracker/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../widget/bank_card_widget.dart';

class CardController extends GetxController {
  final cardNumberClt = TextEditingController();
  final cardHolderClt = TextEditingController();
  final expirationClt = TextEditingController();
  final securityCodeClt = TextEditingController();
  final balanceClt = TextEditingController();
  final cardTypeClt = TextEditingController();
  final cardDescriptionClt = TextEditingController();
  final int id = 0;

  RxList<CardModel> cardData = <CardModel>[].obs;
  final CardService _cardService = CardService();

  @override
  void onInit() {
    getCardList();
    super.onInit();
  }

  List<Widget> get myCards => cardData
      .asMap()
      .entries
      .map(
        (entry) => BankCardWidget(
          holderName: entry.value.cardHolderName,
          balance: entry.value.balance,
          cardType: entry.value.cardType,
          cardNumber: entry.value.cardNumber,
          gradientColors: _getGradientByIndex(entry.key),
        ),
      )
      .toList();

  List<Color> _getGradientByIndex(int index) {
    final gradients = [
      [const Color(0xFF0D0B4A), const Color(0xFF2D62ED)],
      [const Color(0xFF4A0D0D), const Color(0xFFEF4444)],
      [AppColors.primaryVariantLight, AppColors.secondaryLight],
    ];
    return gradients[index % gradients.length];
  }

  Future<void> getCardList() async {
    cardData.value = _cardService.getAllCard();
  }

  Future<void> cardItem() async {
    if (cardNumberClt.text.isNotEmpty &&
        cardTypeClt.text.isNotEmpty &&
        cardHolderClt.text.isNotEmpty &&
        balanceClt.text.isNotEmpty) {
      final newCard = CardModel(
        id: id.toString(),
        cardNumber: cardNumberClt.text.trim(),
        cardHolderName: cardHolderClt.text.trim(),
        balance: balanceClt.text.trim(),
        cardDescription: cardDescriptionClt.text.trim(),
        expiryDate: expirationClt.text.trim(),
        cardType: cardTypeClt.text.trim(),
        securityCode: securityCodeClt.text.trim(),
      );
      await _cardService.getAddCard(newCard);
      await getCardList();
      cardClear();
      Get.snackbar("সফল!", "ডাটা সেভ হয়েছে");
      Get.toNamed(AppRoutes.main);
    } else {
      Get.snackbar("এরর", "অনুগ্রহপূর্বক ফরমটি পূরণ করুন");
    }
  }

  Future<void> getDeleted(int index) async {
    try {
      await _cardService.getDeletedCard(index);
      await getCardList();
      Get.back();
      Get.snackbar(
        "সফল!",
        "কার্ডটি সফলভাবে ডিলিট করা হয়েছে।",
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } catch (e) {
      Get.snackbar(
        "এরর!",
        "ডিলিট করা যায়নি: $e",
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    }
  }

  Future<void> getUpdate(int index) async {
    if (cardNumberClt.text.isNotEmpty &&
        cardTypeClt.text.isNotEmpty &&
        cardHolderClt.text.isNotEmpty &&
        balanceClt.text.isNotEmpty) {
      final updatedCard = CardModel(
        id: index.toString(),
        cardNumber: cardNumberClt.text.trim(),
        cardHolderName: cardHolderClt.text.trim(),
        balance: balanceClt.text.trim(),
        cardDescription: cardDescriptionClt.text.trim(),
        expiryDate: expirationClt.text.trim(),
        cardType: cardTypeClt.text.trim(),
        securityCode: securityCodeClt.text.trim(),
      );
      await _cardService.getUpdateCard(updatedCard, index);
      await getCardList();
      cardClear();
      Get.snackbar("সফল!", "কার্ড আপডেট হয়েছে");
      Get.toNamed(AppRoutes.main);
    } else {
      Get.snackbar("এরর", "অনুগ্রহপূর্বক ফরমটি পূরণ করুন");
    }
  }

  void prefillCard(CardModel card) {
    cardNumberClt.text = card.cardNumber;
    cardHolderClt.text = card.cardHolderName;
    balanceClt.text = card.balance;
    cardDescriptionClt.text = card.cardDescription;
    expirationClt.text = card.expiryDate;
    cardTypeClt.text = card.cardType;
    securityCodeClt.text = card.securityCode;
  }

  void cardClear() {
    cardTypeClt.clear();
    cardDescriptionClt.clear();
    cardHolderClt.clear();
    cardNumberClt.clear();
    balanceClt.clear();
    expirationClt.clear();
    securityCodeClt.clear();
  }
}
