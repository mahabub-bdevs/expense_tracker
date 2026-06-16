import 'package:flutter/material.dart';
import '../utils/app_size_class.dart';
import '../theme/app_colors.dart';
import '../theme/app_dimensions.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool isPassword;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.isPassword = false,
    this.keyboardType = TextInputType.text,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final colors = context.appColors;

    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      keyboardType: keyboardType,
      validator: validator,
      style: TextStyle(
        fontSize: getSp(AppDimensions.fontS),
        color: colors.textPrimary,
      ),
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getRadius(16)),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getRadius(16)),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getRadius(16)),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getRadius(16)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(getRadius(16)),
        ),

        hintText: hintText,
        hintStyle: TextStyle(color: colors.textHint),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(30)),

        contentPadding: EdgeInsets.symmetric(
          horizontal: getWidth(AppDimensions.paddingL),
          vertical: getHeight(AppDimensions.paddingS),
        ),
      ),
    );
  }
}
