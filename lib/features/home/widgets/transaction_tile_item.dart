import 'package:expense_tracker/core/core.dart';
import 'package:expense_tracker/core/utils/app_icons.dart';
import 'package:flutter/material.dart';

class TransactionTileItem extends StatelessWidget {
  final Color? boxColor;
  final String iconPath;
  final String title;
  final String subTitle;
  final String balance;
  final VoidCallback? onTap;
  final int? id;
  const TransactionTileItem({
    super.key,
    this.boxColor = AppColors.warningDark,
    this.iconPath = IconPath.bankIcon,
    required this.title,
    required this.subTitle,
    required this.balance,
    this.onTap,
    this.id = 0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(right: getWidth(20)),
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
                    topRight: Radius.circular(getRadius(5)),
                    bottomRight: Radius.circular(getRadius(5)),
                  ),
                  color: AppColors.backgroundDark,
                ),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: getWidth(10),
                    right: getWidth(10),
                  ),
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
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.borderLight,
                              ),
                              child: Center(
                                child: CustomText(
                                  text: iconPath,
                                  fontSize: getSp(14),
                                  color: AppColors.backgroundDark,
                                ),
                              ),
                            ),

                            Padding(
                              padding: EdgeInsets.only(left: getWidth(15)),
                              child: Expanded(
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
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsetsGeometry.only(
                            left: getWidth(10),
                            right: getWidth(10),
                            top: getHeight(5),
                            bottom: getHeight(5),
                          ),
                          height: getHeight(45),
                          width: getWidth(120),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(getRadius(20)),
                            border: BoxBorder.all(
                              width: 3,
                              color: AppColors.exBg1,
                            ),
                          ),
                          child: Center(
                            child: CustomText(
                              text: "-৳ $balance",
                              fontSize: getSp(8),
                              color: AppColors.backgroundLight,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
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
      ),
    );
  }
}
