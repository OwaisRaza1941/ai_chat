import 'package:ai_chat/auth/login/login_screen.dart';
import 'package:ai_chat/components/profile_tile.dart';
import 'package:ai_chat/controller/auth_controller.dart';
import 'package:ai_chat/dailog/logout_dialoge.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LogoutButton extends StatelessWidget {
  final bool isDark;
  const LogoutButton({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    /// AuthController
    final AuthController authController = Get.find();
    return tile(
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
    );
  }
}
