import 'package:ai_chat/components/setting_tile.dart';
import 'package:ai_chat/controller/theme_controller.dart';
import 'package:ai_chat/screens/setting/widgets/setting_appbar.dart';
import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:ai_chat/widgets/custom_app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Theme Controller
    final ThemeController themeController = Get.find();

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AppPadding(
        bottom: 20,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            /// Setting App Bar
            SettingAppBar(),
            SizedBox(height: 20),

            //// Appearance
            Text(
              "Appearance",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),

            settingTile(
              Icons.dark_mode_outlined,
              "Theme",
              context,
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
            settingTile(
              Icons.color_lens_outlined,
              "Accent Color",
              context,

              trailing: Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Color(0xff7C3AED),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            SizedBox(height: 25),

            /// General
            Text(
              "General",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),

            settingTile(Icons.text_fields, "Font Size", context),
            settingTile(
              Icons.chat_bubble_outline,
              "Chat Bubble Style",
              context,
            ),
            settingTile(
              Icons.vibration,
              "Haptic Feedback",
              context,
              trailing: Switch(
                value: true,
                onChanged: (v) {},

                activeColor: AppColors.primaryPurple,
              ),
            ),
            settingTile(
              Icons.volume_up_outlined,
              "Sound",
              context,

              trailing: Switch(
                value: true,
                onChanged: (v) {},
                activeColor: AppColors.primaryPurple,
              ),
            ),
            SizedBox(height: 25),

            /// About
            Text(
              "About",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 15),

            settingTile(Icons.info_outline, "About AI Chat", context),
            settingTile(Icons.privacy_tip_outlined, "Privacy Policy", context),
            settingTile(
              Icons.description_outlined,
              "Terms of Service",
              context,
            ),
          ],
        ),
      ),
    );
  }
}
