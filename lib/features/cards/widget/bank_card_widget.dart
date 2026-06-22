import 'package:expense_tracker/core/core.dart';
import 'package:flutter/material.dart';

class BankCardWidget extends StatelessWidget {
  final String holderName;
  final String balance;
  final String cardNumber;
  final List<Color> gradientColors;
  final String cardType;
  final String cardDescription;

  const BankCardWidget({
    super.key,
    required this.holderName,
    required this.balance,
    required this.cardNumber,
    required this.gradientColors,
    this.cardType = "VISA",
    this.cardDescription = "Amazon Platinum",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getRadius(24)),
        gradient: LinearGradient(
          colors: gradientColors,
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        boxShadow: [
          BoxShadow(
            color: gradientColors.last.withValues(alpha: 0.3),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: EdgeInsets.all(getHeight(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Card Holder Name
          Text(
            holderName,
            style: TextStyle(
              color: Colors.white,
              fontSize: getSp(18),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getHeight(4)),
          //Card Description
          CustomText(
            text: cardDescription,
            color: AppColors.backgroundLight.withValues(alpha: 0.6),
            fontSize: getSp(10),
          ),

          const Spacer(),

          // Card Number
          CustomText(
            text: cardNumber,
            color: Colors.white,
            fontSize: getSp(18),
            letterSpacing: 2.0,
          ),
          SizedBox(height: getHeight(5)),

          //Balance and Card Type
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomText(
                text: "৳$balance",
                color: Colors.white,
                fontSize: getSp(15),
                fontWeight: FontWeight.bold,
              ),
              Text(
                cardType,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getSp(18),
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
