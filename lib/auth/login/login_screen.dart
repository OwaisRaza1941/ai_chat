import 'package:ai_chat/auth/login/widgets/login_from.dart';
import 'package:ai_chat/auth/singUp/widgets/sing_up_socail_btn.dart';
import 'package:ai_chat/widgets/custom_app_padding.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final VoidCallback onSwitch;
  const LoginScreen({super.key, required this.onSwitch});

  @override
  Widget build(BuildContext context) {
    /// THEME
    /// WE USE IT TO GET THE CURRENT THEME AND CHECK IF IT'S DARK OR LIGHT
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: AppPadding(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE
                Text(
                  "Login Again!",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),

                /// SUBTITLE
                Text(
                  "Login up to continue using AI Chat",
                  style: theme.textTheme.bodyMedium,
                ),
                SizedBox(height: 40),

                LoginForm(onSwitch: onSwitch),

                /// SOCIAL BUTTONS
                SinUpSocialButtons(isDark: isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
