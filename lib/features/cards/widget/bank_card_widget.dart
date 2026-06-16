import 'package:flutter/material.dart';

import '../../../core/utils/app_size_class.dart';

class BankCardWidget extends StatelessWidget {
  final String holderName;
  final String balance;
  final String cardNumber;
  final List<Color> gradientColors;
  final String cardType; // e.g., "VISA" or "MasterCard"

  const BankCardWidget({
    super.key,
    required this.holderName,
    required this.balance,
    required this.cardNumber,
    required this.gradientColors,
    this.cardType = "VISA",
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
            color: gradientColors.last.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      padding: EdgeInsets.all(getHeight(24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // কার্ড হোল্ডারের নাম
          Text(
            holderName,
            style: TextStyle(
              color: Colors.white,
              fontSize: getSp(20),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: getHeight(4)),
          const Text(
            "Amazon Platinum",
            style: TextStyle(color: Colors.white70, fontSize: 14),
          ),

          const Spacer(),

          // কার্ড নাম্বার
          Text(
            cardNumber,
            style: TextStyle(
              color: Colors.white,
              fontSize: getSp(18),
              letterSpacing: 2,
            ),
          ),
          SizedBox(height: getHeight(12)),

          // ব্যালেন্স এবং লোগো
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                balance,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getSp(24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                cardType,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: getSp(22),
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
