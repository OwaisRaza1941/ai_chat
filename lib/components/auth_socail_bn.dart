import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:flutter/material.dart';

GestureDetector socialButtons({
  required BuildContext context,
  required bool isDark,
  required bool isLoading,
  required ThemeData theme,
  required String image,
  required VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 60,
      height: 60,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Theme.of(context).cardColor,
        border: isDark ? null : Border.all(color: theme.dividerColor),
      ),
      child: isLoading
          ? SizedBox(
              height: 20,
              width: 20,
              child: CircularProgressIndicator(
                strokeWidth: 1,
                color: AppColors.primaryBlue,
              ),
            )
          : Image.asset(image, fit: BoxFit.contain),
    ),
  );
}
