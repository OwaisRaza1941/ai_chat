import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  final String hinText;
  final IconData? suffixIon;
  final IconData? prefixIcon;
  final Color? color;
  final Color? iconColor;
  final Color? hintTextColor;
  final TextEditingController? controller;
  const CustomTextfield({
    required this.hinText,
    this.suffixIon,
    this.prefixIcon,
    this.hintTextColor,
    this.iconColor,
    this.controller,
    super.key,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        border: isDark ? null : Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: TextField(
        controller: controller,
        style: AppTextStyle.bodySmall.copyWith(
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
        decoration: InputDecoration(
          hintText: hinText,
          hintStyle: AppTextStyle.buttonMedium.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w100,
            color: isDark ? AppColors.greyText : Colors.grey,
          ),
          prefixIcon: Icon(
            prefixIcon,
            color: isDark ? AppColors.iconInactive : Colors.grey,
          ),
          border: InputBorder.none,
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 14),
        ),
      ),
    );
  }
}
