import 'package:ai_chat/components/fromat_chat.dart';
import 'package:ai_chat/controller/chat_controller.dart';
import 'package:ai_chat/model/chat_room.dart';
import 'package:ai_chat/screens/chat/chat_screen.dart';
import 'package:ai_chat/screens/history/widgets/history_card.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:ai_chat/widgets/custom_app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find();
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: AppPadding(
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              Text(
                "History",
                style: AppTextStyle.h1.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),

              SizedBox(height: 20),

              Expanded(
                child: StreamBuilder<List<ChatRoom>>(
                  stream: chatController.getChats(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData) {
                      return Center(child: CircularProgressIndicator());
                    }

                    final chats = snapshot.data!;
                    if (chats.isEmpty) {
                      return Center(child: Text("No chats yet"));
                    }

                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      itemCount: chats.length,
                      itemBuilder: (context, index) {
                        final chat = chats[index];
                        return GestureDetector(
                          onTap: () {
                            chatController.conversationId.value = chat.id;
                            Get.to(() => ChatScreen());
                          },
                          child: HistoryCard(
                            title: chat.title,
                            subtitle: chat.lastMessage,
                            time: formatChatTime(chat.updatedAt),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
