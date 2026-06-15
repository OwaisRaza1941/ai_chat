import 'package:ai_chat/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingAppBar extends StatelessWidget {
  const SettingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_outlined,
            color: Theme.of(context).iconTheme.color,
          ),
        ),

        SizedBox(width: 10),
        Text(
          'Settings',
          style: AppTextStyle.h2.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color,
          ),
        ),
      ],
    );
  }
}
