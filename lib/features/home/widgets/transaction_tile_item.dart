import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/core/utils/app_icons.dart';
import 'package:expense_tracker/core/widgets/custom_svg_icon.dart';
import 'package:flutter/material.dart';

class TransactionTileItem extends StatelessWidget {
  final Color? boxColor;
  final String iconPath;
  final String title;
  final String subTitle;
  final String balance;

  const TransactionTileItem({
    super.key,
    this.boxColor = AppColors.warningDark,
    this.iconPath = IconPath.bankIcon,
    required this.title,
    required this.subTitle,
    required this.balance,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(right: getWidth(20)),
      child: Stack(
        children: [
          Container(
            height: getHeight(90),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getRadius(20)),
              color: boxColor ?? AppColors.warningDark,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(right: getWidth(10)),
            child: Container(
              height: getHeight(90),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(getRadius(20)),
                  bottomLeft: Radius.circular(getRadius(20)),
                  topRight: Radius.circular(5),
                  bottomRight: Radius.circular(5),
                ),
                color: AppColors.backgroundDark,
              ),
              child: Padding(
                padding: EdgeInsets.only(left: getWidth(10), right: getWidth(10)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            height: getHeight(45),
                            width: getWidth(45),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: AppColors.borderLight,
                            ),
                            child: Center(
                              child: CustomSvgIcon(
                                assetName: iconPath,
                                height: getHeight(25),
                                width: getWidth(25),
                              ),
                            ),
                          ),
      
                          Padding(
                            padding: EdgeInsets.only(left: getWidth(15)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                  text: title,
                                  fontSize: getSp(12),
                                  color: AppColors.backgroundLight,
                                  fontWeight: FontWeight.w800,
                                ),
                                CustomText(
                                  text: subTitle,
                                  fontSize: getSp(10),
                                  color: AppColors.backgroundLight,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: getHeight(45),
                      width: getWidth(120),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(getRadius(20)),
                        border: BoxBorder.all(width: 3, color: AppColors.exBg1),
                      ),
                      child: Center(
                        child: CustomText(
                          text: "-₹ $balance",
                          fontSize: getSp(8),
                          color: AppColors.backgroundLight,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
