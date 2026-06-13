import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:ai_chat/utils/style/text_style.dart';

class ExploreCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color? iconColor;

  const ExploreCard({
    super.key,
    required this.title,
    required this.icon,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: Container(
          padding: EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Theme.of(context).cardColor.withOpacity(0.5),
            borderRadius: BorderRadius.circular(20),
            border: isDark
                ? null
                : Border.all(color: Colors.white.withOpacity(0.15)),
            boxShadow: isDark
                ? null
                : [
                    BoxShadow(
                      color: Color(0xff7C3AED).withOpacity(.15),
                      blurRadius: 20,
                      spreadRadius: 2,
                    ),
                  ],
          ),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(icon, color: iconColor, size: 35),
              Spacer(),
              Text(
                title,
                style: AppTextStyle.bodyMedium.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
