import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/core/utils/app_icons.dart';
import 'package:expense_tracker/core/widgets/custom_svg_icon.dart';
import 'package:expense_tracker/features/cards/controller/card_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../widget/credit_card_form_item.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CardController>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: CustomText(text: "Wallet", fontSize: getSp(12)),
        actions: [
          CustomSvgIcon(assetName: IconPath.manuIcon),
          SizedBox(width: getWidth(20)),
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.exBg3,
              AppColors.exBg1.withValues(alpha: 0.8),
              AppColors.exBg1.withValues(alpha: 0.8),
              AppColors.exBg3,
            ],
            end: AlignmentGeometry.bottomEnd,
            begin: AlignmentGeometry.topLeft,
            stops: [0.0, 0.3, 0.7, 1.5],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: getHeight(90)),
              CustomText(
                text: "Cards",
                fontSize: getSp(12),
                color: AppColors.warningDark,
              ),
              Divider(
                endIndent: 50,
                indent: 50,
                height: 30,
                color: AppColors.backgroundLight.withValues(alpha: 0.2),
                thickness: 5.0,
                radius: BorderRadius.circular(getRadius(5)),
              ),
              10.h.verticalSpace,
              SizedBox(
                height: getHeight(215),
                child: CardSwiper(
                  cardsCount: controller.myCards.length,
                  numberOfCardsDisplayed: controller.myCards.length >= 3
                      ? 3
                      : controller.myCards.length,
                  backCardOffset: const Offset(0, 40),
                  scale: 0.9,
                  cardBuilder: (context, index, x, y) =>
                      controller.myCards[index],
                ),
              ),
              35.h.verticalSpace,
              Padding(
                padding: EdgeInsets.only(
                  left: getWidth(25),
                  right: getWidth(25),
                ),
                child: CreditCardFormItem(
                  cardHolderName: controller.cardHolderClt,
                  cardNumber: controller.cardNumberClt,
                  expiration: controller.expirationClt,
                  securityCode: controller.securityCodeClt,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
