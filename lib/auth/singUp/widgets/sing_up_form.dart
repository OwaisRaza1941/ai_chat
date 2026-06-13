import 'package:ai_chat/auth/login/login_screen.dart';
import 'package:ai_chat/controller/auth_controller.dart';
import 'package:ai_chat/widgets/auth_textFildes.dart';
import 'package:ai_chat/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SingUpFrom extends StatelessWidget {
  SingUpFrom({super.key});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();
    final theme = Theme.of(context);

    return Column(
      children: [
        /// NAME
        Obx(
          () => AuthTextField(
            hintText: "Full Name",
            prefixIcon: Icons.person,
            controller: nameController,
            showSuccess: authController.isNameValid.value,
            errorText: authController.nameError.value,
            onChanged: authController.validateName,
          ),
        ),

        SizedBox(height: 15),

        /// EMAIL
        Obx(
          () => AuthTextField(
            hintText: "Email Address",
            prefixIcon: Icons.email,
            controller: emailController,
            showSuccess: authController.isEmailValid.value,
            errorText: authController.emailError.value,
            onChanged: authController.validateEmail,
          ),
        ),
        SizedBox(height: 15),

        /// PASSWORD
        Obx(
          () => AuthTextField(
            hintText: "Password",
            prefixIcon: Icons.lock,
            controller: passwordController,
            showSuccess: authController.isPasswordValid.value,
            errorText: authController.passwordError.value,
            onChanged: authController.validatePassword,
            obscureText: true,
          ),
        ),

        SizedBox(height: 30),

        /// SIGN UP BUTTON
        Obx(() {
          return CustomButton(
            text: 'SingUp',
            onPressed: () async {
              if (!authController.isNameValid.value ||
                  !authController.isEmailValid.value ||
                  !authController.isPasswordValid.value) {
                Get.snackbar(
                  "Invalid Input",
                  "Please correct the errors before signing up.",
                  backgroundColor: theme.textTheme.bodyMedium!.color!
                      .withOpacity(0.1),
                  colorText: Colors.white,
                );
                return;
              }
              await authController.sinUpWitEmailPassword(
                nameController.text,
                emailController.text,
                passwordController.text,
              );
            },
            isLoading: authController.sinUpLoading.value,
          );
        }),

        SizedBox(height: 20),

        /// LOGIN TEXT
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Already have an account? ", style: theme.textTheme.bodySmall),
            TextButton(
              onPressed: () {
                Get.to(LoginScreen());
              },
              child: Text(
                "LogIn",
                style: TextStyle(
                  color: theme.colorScheme.primary,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
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
