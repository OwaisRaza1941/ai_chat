import 'package:ai_chat/controller/chat_controller.dart';
import 'package:ai_chat/model/chat_model.dart';
import 'package:ai_chat/screens/chat/widgets/chat_app.dart';
import 'package:ai_chat/screens/chat/widgets/chat_bubble.dart';
import 'package:ai_chat/screens/chat/widgets/messeg_fields.dart';
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

    /// Chat Controller
    final ChatController chatController = Get.find();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AppPadding(
        bottom: 15,
        child: Column(
          children: [
            /// Chat AppBar
            ChatAppBar(),

            /// CHat Messege
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
                      padding: EdgeInsets.zero,
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

            //// Loading
            Obx(() {
              if (!chatController.isLoading.value) {
                return SizedBox();
              }
              return Padding(
                padding: EdgeInsets.all(12),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/logos/logo.png',
                      fit: BoxFit.cover,
                      width: 80,
                      height: 80,
                    ),
                    SizedBox(width: 8),
                    CircularProgressIndicator(
                      strokeWidth: 2,
                      color: isDark ? AppColors.purpleGlow : AppColors.blueGlow,
                    ),
                  ],
                ),
              );
            }),

            // 👇 INPUT BOX ALWAYS FIXED
            MessegFields(isDark: isDark, messageController: messageController),
          ],
        ),
      ),
    );
  }
}
