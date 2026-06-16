import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/core/utils/app_icons.dart';
import 'package:expense_tracker/core/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PaymentCardItem extends StatelessWidget {
  const PaymentCardItem({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Container(
      width: double.infinity,
      padding: EdgeInsetsGeometry.only(
        left: getWidth(20),
        right: getWidth(20),
        bottom: getHeight(20),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(getRadius(20)),
        color: colors.primary.withValues(alpha: 0.2),
      ),
      child: Padding(
        padding: EdgeInsets.only(left: getWidth(5), top: getHeight(15)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              text: "Payment Methods",
              fontSize: getSp(14),
              fontWeight: FontWeight.w800,
            ),
            14.h.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                PaymentMethodCard(
                  onTap: () {
                    debugPrint("Click Add Balance");
                  },
                  imagePath: IconPath.addCircleIcon,
                  bankName: "ADD PAYMENT",
                ),
                15.w.horizontalSpace,
                PaymentMethodCard(
                  imagePath: IconPath.bankIcon,
                  bankName: "BANK BALANCE",
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class PaymentMethodCard extends StatelessWidget {
  final String imagePath;
  final String bankName;
  final VoidCallback? onTap;
  const PaymentMethodCard({
    super.key,
    required this.imagePath,
    required this.bankName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: getHeight(80),
            width: getWidth(80),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: colors.primaryVariant.withValues(alpha: 0.2),
            ),
            child: Center(
              child: CustomSvgIcon(
                assetName: imagePath,
                height: getHeight(50),
                width: getWidth(50),
                color: colors.textPrimary,
              ),
            ),
          ),
        ),
        5.h.verticalSpace,
        CustomText(text: bankName, fontSize: getSp(10)),
      ],
    );
  }
}
