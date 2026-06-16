import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../widget/bank_card_widget.dart';

class CardController extends GetxController {
  final cardNumberClt = TextEditingController();
  final cardHolderClt = TextEditingController();
  final expirationClt = TextEditingController();
  final securityCodeClt = TextEditingController();

  final List<Widget> myCards = [
    const BankCardWidget(
      holderName: "John Smith",
      balance: "\$3,469.52",
      cardNumber: "4756  ••••  ••••  9018",
      gradientColors: [Color(0xFF0D0B4A), Color(0xFF2D62ED)],
    ),
    const BankCardWidget(
      holderName: "Mahabub Alam",
      balance: "\$10,250.00",
      cardNumber: "5124  ••••  ••••  1234",
      gradientColors: [Color(0xFF4A0D0D), Color(0xFFEF4444)],
    ),
    BankCardWidget(
      holderName: "Majharul Islam",
      balance: "\$10,850.50",
      cardNumber: "5945  ••••  ••••  4321",
      gradientColors: [AppColors.primaryVariantLight, AppColors.secondaryLight],
    ),
  ];
}
