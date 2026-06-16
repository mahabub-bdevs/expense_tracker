import 'package:expense_tracker/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCardFormItem extends StatelessWidget {
  final TextEditingController cardNumber;
  final TextEditingController cardHolderName;
  final TextEditingController expiration;
  final TextEditingController securityCode;
  const CreditCardFormItem({
    super.key,
    required this.cardNumber,
    required this.cardHolderName,
    required this.expiration,
    required this.securityCode,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsGeometry.only(
        top: getHeight(20),
        bottom: getHeight(20),
        right: getWidth(25),
        left: getWidth(10),
      ),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(getRadius(35)),
          topLeft: Radius.circular(getRadius(35)),
        ),
        color: AppColors.backgroundLight.withValues(alpha: 0.1),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: getWidth(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            10.h.verticalSpace,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.add, size: getSp(24), color: AppColors.warningDark),
                5.w.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Add card",
                      fontSize: getSp(13),
                      color: AppColors.warningDark,
                    ),
                    8.h.verticalSpace,
                    CustomText(
                      text: "Add your credit / debit card",
                      fontSize: getSp(9),
                      color: AppColors.backgroundLight,
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: getHeight(40)),
            CustomTextField(controller: cardNumber, hintText: "Card Number"),
            SizedBox(height: getHeight(20)),
            CustomTextField(
              controller: cardHolderName,
              hintText: "Cardholder name",
            ),
            SizedBox(height: getHeight(20)),
            Row(
              children: [
                Expanded(
                  child: CustomTextField(
                    controller: expiration,
                    hintText: "Expiration Date",
                  ),
                ),
                15.w.horizontalSpace,
                Expanded(
                  child: CustomTextField(
                    controller: securityCode,
                    hintText: "Security Code",
                  ),
                ),
              ],
            ),
            20.h.verticalSpace,
            Align(
              alignment: AlignmentGeometry.center,
              child: Container(
                width: getWidth(100),
                padding: EdgeInsetsGeometry.only(
                  top: getHeight(8),
                  bottom: getHeight(8),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getRadius(10)),
                  gradient: LinearGradient(
                    colors: [
                      AppColors.warningDark.withValues(alpha: 0.5),
                      AppColors.warningLight,
                    ],
                    begin: AlignmentGeometry.centerLeft,
                    end: AlignmentGeometry.centerRight,
                    tileMode: TileMode.mirror,
                  ),
                ),
                child: Center(child: CustomText(text: "Next")),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
