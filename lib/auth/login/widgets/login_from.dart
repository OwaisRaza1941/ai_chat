import 'package:ai_chat/auth/resetpassword/reset_password.dart';
import 'package:ai_chat/controller/auth_controller.dart';
import 'package:ai_chat/dailog/app_snackbar.dart';
import 'package:ai_chat/widgets/auth_textFildes.dart';
import 'package:ai_chat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginForm extends StatelessWidget {
  final VoidCallback onSwitch;
  LoginForm({super.key, required this.onSwitch});

  /// CONTROLLERS
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    /// AUTH CONTROLLER
    /// WE USE IT TO CALL THE LOGIN FUNCTION IN THE CONTROLLER WHEN THE USER CLICKS THE LOGIN BUTTON
    final AuthController authController = Get.find();
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// EMAIL
        Obx(() {
          return AuthTextField(
            hintText: "Email Address",
            prefixIcon: Icons.email,
            controller: emailController,
            errorText: authController.emailError.value,
            showSuccess: authController.isEmailValid.value,
            onChanged: authController.validateEmail,
          );
        }),

        SizedBox(height: 30),

        /// PASSWORD
        Obx(() {
          return AuthTextField(
            hintText: "Password",
            prefixIcon: Icons.lock,
            controller: passwordController,
            obscureText: authController.isPasswordHidden.value,
            errorText: authController.passwordError.value,
            showSuccess: authController.isPasswordValid.value,
            onChanged: authController.validatePassword,
            onTogglePassword: authController.togglePasswordVisibility,
          );
        }),

        SizedBox(height: 30),
        Align(
          alignment: Alignment.topRight,
          child: TextButton(
            onPressed: () {
              Get.to(ResetPassword());
            },
            child: Text('ForgotPassword?'),
          ),
        ),

        SizedBox(height: 10),

        /// LOGIN UP BUTTON
        Obx(
          () => CustomButton(
            text: 'LogIn',
            isLoading: authController.loginLoading.value,
            onPressed: () async {
              if (emailController.text.isEmpty ||
                  passwordController.text.isEmpty) {
                AppSnackbar.error('Please fill the value before Login!');
                return;
              }
              await authController.loginWithEmalAndPassword(
                emailController.text,
                passwordController.text,
              );
            },
          ),
        ),

        SizedBox(height: 20),

        /// LOGIN TEXT
        /// WE USE IT TO NAVIGATE TO THE SING UP SCREEN WHEN THE USER CLICKS THE SING UP TEXT
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Don't have an account? ", style: theme.textTheme.bodySmall),
            TextButton(
              onPressed: onSwitch,
              child: Text(
                "SingUp",
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),

        SizedBox(height: 20),
      ],
    );
  }
}
