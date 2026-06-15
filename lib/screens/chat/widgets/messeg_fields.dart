import 'package:ai_chat/controller/chat_controller.dart';
import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessegFields extends StatelessWidget {
  final bool isDark;
  final TextEditingController messageController;
  const MessegFields({
    super.key,
    required this.isDark,
    required this.messageController,
  });

  @override
  Widget build(BuildContext context) {
    /// Chat Controller
    final ChatController chatController = Get.find();
    return SafeArea(
      child: Row(
        spacing: 10,
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: isDark ? AppColors.cardColor : Colors.white,
                border: isDark
                    ? null
                    : Border.all(color: AppColors.primaryBlue),
                borderRadius: BorderRadius.circular(25),
              ),
              child: TextField(
                maxLines: null,
                controller: messageController,
                decoration: InputDecoration(
                  hintText: 'Type a messege',
                  hintStyle: TextStyle(color: AppColors.greyText),
                  border: InputBorder.none,
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 10,
                  ),
                ),
              ),
            ),
          ),
          CircleAvatar(
            radius: 22,
            backgroundColor: isDark
                ? AppColors.primaryPurple
                : AppColors.blueGlow,
            child: IconButton(
              icon: Icon(
                Icons.send,
                color: isDark ? Colors.white : Colors.white,
              ),
              onPressed: () async {
                final text = messageController.text.trim();
                if (text.isEmpty) return;

                messageController.clear();
                await chatController.sendMessage(text);
              },
            ),
          ),
        ],
      ),
    );
  }
}
