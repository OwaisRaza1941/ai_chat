import 'package:ai_chat/controller/chat_controller.dart';
import 'package:ai_chat/screens/chat/chat_screen.dart';
import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StartNewChats extends StatelessWidget {
  const StartNewChats({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    final ChatController chatController = Get.find();

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: theme.cardColor,
        border: isDark ? null : Border.all(color: theme.dividerColor),
        borderRadius: BorderRadius.circular(15),
      ),

      child: ListTile(
        onTap: () async {
          await chatController.startNewChat();
          Get.to(() => ChatScreen());
        },

        title: Row(
          children: [
            // ➕ LEFT ICON BOX
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: isDark ? AppColors.cardColorLight : Colors.grey.shade200,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Icon(
                Icons.add,
                color: isDark ? AppColors.whiteText : Colors.black,
              ),
            ),

            SizedBox(width: 8),

            // TEXT
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'New Chat',
                    style: AppTextStyle.bodyMedium.copyWith(
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),

                  Text(
                    'Start a new conversation',
                    style: AppTextStyle.bodySmall.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w100,
                      color: isDark ? AppColors.lightGreyText : Colors.grey,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        // ➕ RIGHT BUTTON
        trailing: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            color: isDark ? AppColors.primaryGreen : AppColors.primaryBlue,
            borderRadius: BorderRadius.circular(15),
          ),
          child: Icon(
            Icons.add,
            color: isDark ? AppColors.iconColor : Colors.white,
          ),
        ),
      ),
    );
  }
}
