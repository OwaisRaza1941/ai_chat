import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:flutter/material.dart';

Widget tile({
  required bool isDark,
  required IconData icon,
  required String title,
  required BuildContext context,
  VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(18),
        border: isDark ? null : Border.all(color: AppColors.primaryPurple),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: AppColors.primaryPurple.withOpacity(.25),
                  blurRadius: 25,
                ),
              ],
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.purpleGlow),
        title: Text(
          title,
          style: AppTextStyle.bodyLarge.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: Theme.of(context).iconTheme.color,
          size: 16,
        ),
      ),
    ),
  );
}
