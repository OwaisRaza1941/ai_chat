import 'package:ai_chat/components/fromat_chat.dart';
import 'package:ai_chat/controller/chat_controller.dart';
import 'package:ai_chat/model/chat_room.dart';
import 'package:ai_chat/screens/home/widgets/animated_chats_card.dart';
import 'package:ai_chat/screens/home/widgets/home_app_bar.dart';
import 'package:ai_chat/screens/home/widgets/home_drawer.dart';
import 'package:ai_chat/screens/home/widgets/start_new_chats.dart';
import 'package:ai_chat/widgets/custom_app_padding.dart';
import 'package:ai_chat/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      drawer: HomeDrawer(),
      body: AppPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// App Bar
            HomeAppBar(),
            SizedBox(height: 20),

            /// Search Field
            CustomTextfield(
              hinText: 'Search conversions...',
              prefixIcon: Icons.search,
              color: Theme.of(context).cardColor,
              hintTextColor: Theme.of(context).primaryColor,
              iconColor: Theme.of(context).primaryColor,
            ),
            SizedBox(height: 20),

            /// Start New Chats
            StartNewChats(),
            SizedBox(height: 20),

            /// Recent Chats
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
                      return AnimatedChatCard(
                        title: chat.title,
                        subtitle: chat.lastMessage,
                        time: formatChatTime(chat.updatedAt),
                        icon: Icons.chat,
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
