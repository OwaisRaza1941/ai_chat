import 'package:ai_chat/auth/singUp/widgets/sing_up_form.dart';
import 'package:ai_chat/auth/singUp/widgets/sing_up_socail_btn.dart';
import 'package:ai_chat/widgets/custom_app_padding.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,

      body: SafeArea(
        child: AppPadding(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                /// TITLE
                Text(
                  "Create Account",
                  style: theme.textTheme.bodyLarge?.copyWith(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 8),

                Text(
                  "Sign up to continue using AI Chat",
                  style: theme.textTheme.bodyMedium,
                ),

                SizedBox(height: 40),

                SingUpFrom(),

                SinUpSocialButtons(isDark: isDark),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
