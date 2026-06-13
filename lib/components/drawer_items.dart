import 'package:flutter/material.dart';
import 'package:ai_chat/utils/style/text_style.dart';

Widget drawerItems({
  required BuildContext context,
  required String text,
  required IconData icon,
  VoidCallback? onTap,
}) {
  final theme = Theme.of(context);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      ListTile(
        onTap: onTap,

        leading: Icon(icon, color: theme.iconTheme.color),

        title: Text(
          text,
          style: AppTextStyle.bodyMedium.copyWith(
            color: theme.textTheme.bodyLarge?.color,
          ),
        ),
      ),
      SizedBox(height: 15),
    ],
  );
}
