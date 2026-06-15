import 'package:ai_chat/components/profile_tile.dart';
import 'package:ai_chat/screens/history/history_screen.dart';
import 'package:ai_chat/screens/profile/widgets/logout_btn.dart';
import 'package:ai_chat/screens/profile/widgets/profile_card.dart';
import 'package:ai_chat/screens/setting/setting_screen.dart';
import 'package:ai_chat/widgets/custom_app_padding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    /// Check if dark mode is enabled
    bool isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: AppPadding(
            bottom: 20,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                /// Profile Card
                ProfileCard(isDark: isDark),
                SizedBox(height: 25),

                /// Profile Options
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    tile(
                      isDark: isDark,
                      icon: Icons.person_outline,
                      title: "Edit Profile",
                      context: context,
                    ),
                    tile(
                      isDark: isDark,
                      icon: Icons.bookmark_border,
                      title: "Saved Messages",
                      context: context,
                    ),
                    tile(
                      isDark: isDark,
                      icon: Icons.history,
                      title: "History",
                      context: context,
                      onTap: () {
                        Get.to(HistoryScreen());
                      },
                    ),

                    tile(
                      isDark: isDark,
                      icon: Icons.settings_outlined,
                      title: "Settings",
                      context: context,
                      onTap: () {
                        Get.to(SettingsScreen());
                      },
                    ),
                    LogoutButton(isDark: isDark),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
