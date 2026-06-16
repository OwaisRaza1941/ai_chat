import 'package:ai_chat/controller/auth_controller.dart';
import 'package:ai_chat/dailog/app_snackbar.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:ai_chat/widgets/auth_textFildes.dart';
import 'package:ai_chat/widgets/custom_app_padding.dart';
import 'package:ai_chat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetPassword extends StatelessWidget {
  ResetPassword({super.key});

  final TextEditingController emailController = TextEditingController();
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: AppPadding(
        bottom: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Reset Password',
              style: AppTextStyle.h2.copyWith(
                color: Theme.of(context).textTheme.bodyLarge?.color,
              ),
            ),
            SizedBox(height: 15),

            Text(
              'Reset your password with send your email?',
              style: AppTextStyle.bodyMedium.copyWith(
                color: Theme.of(context).textTheme.bodyMedium?.color,
              ),
            ),

            SizedBox(height: 30),

            AuthTextField(
              prefixIcon: Icons.email,
              hintText: 'Email',
              controller: emailController,
            ),

            Spacer(),

            Obx(() {
              return CustomButton(
                text: 'Reset Password',
                isLoading: authController.resetPasswordLoading.value,
                onPressed: () async {
                  if (emailController.text.isEmpty) {
                    AppSnackbar.error('Please Email fill!');
                    return;
                  }
                  await authController.resetPassword(emailController.text);
                  Get.back();
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
