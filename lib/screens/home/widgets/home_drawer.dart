import 'package:ai_chat/controller/chat_controller.dart';
import 'package:ai_chat/controller/theme_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:ai_chat/components/drawer_items.dart';
import 'package:ai_chat/screens/chat/chat_screen.dart';
import 'package:ai_chat/screens/setting/setting_screen.dart';
import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:ai_chat/utils/style/text_style.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatController chatController = Get.find();
    final ThemeController themeController = Get.find();

    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Drawer(
      backgroundColor: theme.colorScheme.surface,

      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ================= HEADER =================
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 35,
                  backgroundImage: AssetImage('assets/logos/logo.png'),
                ),

                SizedBox(width: 12),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Ai Assistant',
                      style: AppTextStyle.buttonMedium.copyWith(
                        color: theme.textTheme.bodyLarge?.color,
                      ),
                    ),

                    Text(
                      'Your Smart Companion',
                      style: AppTextStyle.bodySmall.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: isDark
                            ? Colors.grey.shade400
                            : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ],
            ),

            SizedBox(height: 20),

            // ================= NEW CHAT =================
            Container(
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.cardBorder
                    : AppColors.primaryBlue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                onTap: () async {
                  await chatController.startNewChat();

                  Get.to(() => ChatScreen());
                },
                leading: Icon(Icons.add, color: theme.iconTheme.color),
                title: Text(
                  'New Chat',
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),
                trailing: Icon(
                  Icons.arrow_forward_ios,
                  size: 15,
                  color: theme.iconTheme.color,
                ),
              ),
            ),

            SizedBox(height: 15),

            // ================= ITEMS =================
            drawerItems(
              text: 'Explore Prompts',
              icon: Icons.explore_outlined,
              onTap: () {},
              context: context,
            ),
            drawerItems(
              text: 'AI Tools',
              icon: Icons.grid_view_rounded,
              onTap: () {},
              context: context,
            ),
            drawerItems(
              text: 'Saved Messages',
              icon: Icons.bookmark_border_rounded,
              onTap: () {},
              context: context,
            ),
            drawerItems(
              text: 'History',
              icon: Icons.history,
              onTap: () {},
              context: context,
            ),
            drawerItems(
              context: context,

              text: 'Settings',
              icon: Icons.settings_outlined,
              onTap: () {
                Get.to(() => SettingsScreen());
              },
            ),

            Spacer(),

            // ================= DARK MODE =================
            Container(
              decoration: BoxDecoration(
                color: isDark
                    ? AppColors.cardBorder
                    : AppColors.primaryBlue.withOpacity(0.05),
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: Transform.rotate(
                  angle: -0.6,
                  child: Icon(
                    Icons.nightlight_sharp,
                    color: theme.iconTheme.color,
                  ),
                ),
                title: Text(
                  'Dark Mode',
                  style: AppTextStyle.bodyMedium.copyWith(
                    color: theme.textTheme.bodyLarge?.color,
                  ),
                ),

                trailing: Obx(() {
                  return Switch(
                    activeColor: AppColors.primaryPurple,
                    value: themeController.isDarkTheme.value,
                    onChanged: (value) {
                      themeController.changeTheme(value);
                    },
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
