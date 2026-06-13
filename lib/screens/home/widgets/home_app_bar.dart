import 'package:ai_chat/controller/chat_controller.dart';
import 'package:ai_chat/screens/chat/chat_screen.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({super.key});
  final ChatController chatController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                  icon: Icon(
                    Icons.menu,
                    color: Theme.of(context).iconTheme.color,
                  ),
                );
              },
            ),

            SizedBox(width: 10),

            Text(
              'AI',
              style: AppTextStyle.h3.copyWith(
                fontSize: 22,
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 5),
            Text(
              'Chat',
              style: AppTextStyle.h3.copyWith(
                fontSize: 22,
                color: Theme.of(context).textTheme.bodyLarge?.color,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        InkWell(
          onTap: () async {
            await chatController.startNewChat();
            Get.to(() => ChatScreen());
          },
          child: CircleAvatar(
            radius: 20,
            backgroundColor: Theme.of(context).colorScheme.primary,
            child: Icon(Icons.add, color: Theme.of(context).iconTheme.color),
          ),
        ),
      ],
    );
  }
}
