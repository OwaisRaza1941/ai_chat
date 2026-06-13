import 'package:ai_chat/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatAppBar extends StatelessWidget {
  const ChatAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).iconTheme.color,
          ),
        ),
        Text(
          'Flutter UI Ideas',
          style: AppTextStyle.h2.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),

        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.more_vert,
                color: Theme.of(context).iconTheme.color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
