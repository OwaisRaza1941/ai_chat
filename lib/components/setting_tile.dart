import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:flutter/material.dart';

Widget settingTile(
  IconData icon,
  String title,
  BuildContext context, {
  Widget? trailing,
  VoidCallback? onTap,
}) {
  bool isDark = Theme.of(context).brightness == Brightness.dark;
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    decoration: BoxDecoration(
      color: Theme.of(context).cardColor,
      borderRadius: BorderRadius.circular(18),
      border: isDark ? null : Border.all(color: AppColors.primaryPurple),
      boxShadow: isDark
          ? null
          : [
              BoxShadow(
                color: AppColors.primaryPurple.withOpacity(.25),
                blurRadius: 5,
              ),
            ],
    ),

    child: ListTile(
      onTap: onTap,
      leading: Icon(icon, color: AppColors.iconInactive),
      title: Text(
        title,
        style: AppTextStyle.bodyLarge.copyWith(
          color: Theme.of(context).textTheme.bodyLarge?.color,
        ),
      ),
      trailing:
          trailing ??
          Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).iconTheme.color,
          ),
    ),
  );
}
