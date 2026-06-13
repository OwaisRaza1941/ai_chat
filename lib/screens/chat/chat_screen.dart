import 'package:ai_chat/controller/chat_controller.dart';
import 'package:ai_chat/model/chat_model.dart';
import 'package:ai_chat/screens/chat/widgets/chat_app.dart';
import 'package:ai_chat/screens/chat/widgets/chat_bubble.dart';
import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:ai_chat/widgets/custom_app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({super.key});

  /// In a real app, you would typically fetch the chat messages from a backend or a database.
  final TextEditingController messageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /// Check if dark mode is enabled
    /// We will use this to adjust the chat bubble colors and text colors accordingly
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final ChatController chatController = Get.find();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AppPadding(
        bottom: 15,
        child: Column(
          children: [
            ChatAppBar(),

            Expanded(
              child: Obx(() {
                if (chatController.conversationId.value.isEmpty) {
                  return Center(child: Text(''));
                }

                return StreamBuilder<List<ChatMessage>>(
                  stream: chatController.getMessages(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final messages = snapshot.data!;

                    return ListView.builder(
                      controller: chatController.scrollController,
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final msg = messages[index];
                        final isMe = msg.role == "user";

                        return chatBubble(
                          text: msg.text,
                          isMe: isMe,
                          isDark: isDark,
                        );
                      },
                    );
                  },
                );
              }),
            ),

            Obx(() {
              if (!chatController.isLoading.value) {
                return SizedBox();
              }

              return Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    CircularProgressIndicator(strokeWidth: 2),
                    SizedBox(width: 10),
                    Text("AI is typing..."),
                  ],
                ),
              );
            }),

            // 👇 INPUT BOX ALWAYS FIXED
            SafeArea(
              child: Row(
                spacing: 10,
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        color: isDark ? AppColors.cardColor : Colors.white,
                        border: Border.all(
                          color: isDark
                              ? AppColors.cardColor
                              : AppColors.primaryBlue,
                        ),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: TextField(
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
            ),
          ],
        ),
      ),
    );
  }
}
