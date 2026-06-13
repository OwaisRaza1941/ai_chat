import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:flutter/material.dart';

class ToolCard extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color color;

  const ToolCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    /// Check if dark mode is enabledD
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(25),
        border: isDark ? null : Border.all(color: AppColors.primaryPurple),
        boxShadow: isDark
            ? []
            : [
                BoxShadow(
                  color: AppColors.primaryPurple.withOpacity(.25),
                  blurRadius: 5,
                  spreadRadius: 1,
                  offset: Offset(0, 2),
                ),
              ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,

        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
            ),
            child: Icon(icon, color: AppColors.iconColor),
          ),

          SizedBox(height: 8),
          Text(
            title,
            style: AppTextStyle.bodyMedium.copyWith(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            subTitle,
            style: AppTextStyle.labelMedium.copyWith(
              color: AppColors.greyText,
              fontWeight: FontWeight.w100,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
