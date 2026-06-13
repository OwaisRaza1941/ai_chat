import 'package:ai_chat/auth/login/login_screen.dart';
import 'package:ai_chat/controller/auth_controller.dart';
import 'package:ai_chat/dailog/logout_dialoge.dart';
import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    /// Check if dark mode is enabled
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height: 20),

                /// Profile Card
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Theme.of(context).cardColor,
                    borderRadius: BorderRadius.circular(25),
                    border: isDark
                        ? null
                        : Border.all(color: Color(0xff7C3AED)),
                    boxShadow: isDark
                        ? null
                        : [
                            BoxShadow(
                              color: Color(0xff7C3AED).withOpacity(.25),
                              blurRadius: 25,
                            ),
                          ],
                  ),

                  /// Profile Info
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 45,
                        backgroundImage: AssetImage("assets/logos/logo.png"),
                      ),

                      SizedBox(height: 15),

                      Text(
                        "Owais Raza",
                        style: AppTextStyle.bodyLarge.copyWith(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      SizedBox(height: 5),

                      Text(
                        "Flutter Developer",
                        style: AppTextStyle.bodyLarge.copyWith(
                          color: Theme.of(context).textTheme.bodySmall?.color,
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 25),

                /// Profile Options
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _tile(
                      isDark: isDark,
                      icon: Icons.person_outline,
                      title: "Edit Profile",
                      context: context,
                    ),
                    _tile(
                      isDark: isDark,
                      icon: Icons.bookmark_border,
                      title: "Saved Messages",
                      context: context,
                    ),
                    _tile(
                      isDark: isDark,
                      icon: Icons.history,
                      title: "History",
                      context: context,
                    ),
                    _tile(
                      isDark: isDark,
                      icon: Icons.favorite_border,
                      title: "Favorites",
                      context: context,
                    ),
                    _tile(
                      isDark: isDark,
                      icon: Icons.settings_outlined,
                      title: "Settings",
                      context: context,
                    ),
                    _tile(
                      isDark: isDark,
                      icon: Icons.logout,
                      title: "Logout",
                      context: context,
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return LogoutDialoge(
                              onPressed: () async {
                                await authController.logout();
                                Get.offAll(LoginScreen());
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tile({
    required bool isDark,
    required IconData icon,
    required String title,
    required BuildContext context,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(18),
          border: isDark ? null : Border.all(color: AppColors.primaryPurple),
          boxShadow: isDark
              ? []
              : [
                  BoxShadow(
                    color: AppColors.primaryPurple.withOpacity(.25),
                    blurRadius: 25,
                  ),
                ],
        ),
        child: ListTile(
          leading: Icon(icon, color: AppColors.purpleGlow),
          title: Text(
            title,
            style: AppTextStyle.bodyLarge.copyWith(
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).iconTheme.color,
            size: 16,
          ),
        ),
      ),
    );
  }
}
