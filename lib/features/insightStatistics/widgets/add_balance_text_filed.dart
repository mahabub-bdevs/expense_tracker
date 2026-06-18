import 'package:expense_tracker/core/core.dart';
import 'package:flutter/material.dart';


class AddBalanceTextFiled extends StatelessWidget {
  final TextEditingController controller;
  const AddBalanceTextFiled({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      minLines: 1,
      maxLines: 2,
      readOnly: true,
      showCursor: true,
      textAlign: TextAlign.right,
      controller: controller,
      keyboardType: TextInputType.number,
      style: TextStyle(fontSize: getSp(30), color: AppColors.warningDark),
      decoration: InputDecoration(
        prefix: Padding(
          padding: EdgeInsets.only(left: getWidth(10)),
          child: CustomText(
            text: "-",
            fontSize: getSp(25),
            color: AppColors.backgroundLight,
          ),
        ),
        hintTextDirection: TextDirection.ltr,
        focusColor: Colors.transparent,
        fillColor: Colors.transparent,
        hoverColor: Colors.transparent,
        border: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        hintText: "Enter Balance",
        hintStyle: TextStyle(
          fontSize: getSp(30),
          color: AppColors.borderLight.withValues(alpha: 0.5),
        ),
      ),
    );
  }
}
