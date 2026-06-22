import 'package:expense_tracker/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void showCustomDialog(
  BuildContext context,
  VoidCallback onYesTap,
  String yesButton,
  String noButton,
  String title,
  String subTitle,
  String itemValue,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return Center(
        child: SingleChildScrollView(
          child: Dialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.0),
            ),
            elevation: 10,
            backgroundColor: Colors.transparent,
            child: Container(
              padding: EdgeInsetsGeometry.only(
                top: getHeight(20),
                left: getWidth(20),
                right: getWidth(20),
                bottom: getHeight(20),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(getRadius(20)),
                color: AppColors.warningDark,
              ),
              child: Column(
                children: [
                  CustomText(
                    text: title,
                    fontSize: getSp(18),
                    color: AppColors.backgroundLight,
                    fontWeight: FontWeight.w800,
                  ),
                  5.h.verticalSpace,
                  Text.rich(
                    textAlign: TextAlign.center,
                    TextSpan(
                      children: [
                        TextSpan(
                          text: itemValue,
                          style: TextStyle(
                            fontSize: getSp(12),
                            color: AppColors.secondaryLight,
                          ),
                        ),
                        WidgetSpan(child: SizedBox(width: getWidth(10))),
                        TextSpan(
                          text: subTitle,
                          style: TextStyle(
                            fontSize: getSp(12),
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  12.h.verticalSpace,
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.errorDark,
                          ),
                          child: CustomText(
                            text: noButton,
                            fontSize: getSp(12),
                            color: AppColors.backgroundLight,
                          ),
                        ),
                      ),
                      20.h.horizontalSpace,
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onYesTap,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.infoDark,
                          ),
                          child: CustomText(
                            text: yesButton,
                            fontSize: getSp(12),
                            color: AppColors.backgroundDark,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
