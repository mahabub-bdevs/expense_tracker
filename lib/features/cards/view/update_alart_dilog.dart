import 'package:expense_tracker/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void showUpdateDialog(
  BuildContext context,
  TextEditingController cardNumber,
  TextEditingController expiryDate,
  TextEditingController cardType,
  TextEditingController securityCode,
  TextEditingController balance,
  TextEditingController cardHolderName,
  VoidCallback onTap,
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
            backgroundColor: Colors.blueGrey,
            child: Padding(
              padding: const EdgeInsets.all(28.0),
              child: Column(
                children: [
                  CustomTextField(
                    controller: cardNumber,
                    hintText: "Card Number",
                  ),
                  7.h.verticalSpace,
                  CustomTextField(
                    controller: cardHolderName,
                    hintText: "Card Holder Name",
                  ),
                  7.h.verticalSpace,
                  CustomTextField(controller: cardType, hintText: "Card Type"),
                  7.h.verticalSpace,
                  CustomTextField(
                    controller: securityCode,
                    hintText: "Security Code",
                  ),
                  7.h.verticalSpace,
                  CustomTextField(controller: balance, hintText: "Balance"),
                  7.h.verticalSpace,
                  CustomTextField(
                    controller: expiryDate,
                    hintText: "Expiry Date",
                  ),
                  17.h.verticalSpace,
                  CustomButton(text: "আপডেট করুন", onPressed: onTap),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
