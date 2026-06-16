import 'package:ai_chat/components/auth_socail_bn.dart';
import 'package:ai_chat/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SinUpSocialButtons extends StatelessWidget {
  final bool isDark;
  const SinUpSocialButtons({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    final AuthController authController = Get.find();

    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        socialButtons(
          isLoading: authController.googleLoading.value,
          context: context,
          isDark: isDark,
          theme: theme,
          image: 'assets/icons/google_icon.png',
          onTap: () {},
        ),
        SizedBox(width: 30),
        Obx(
          () => socialButtons(
            isLoading: authController.facBookLoading.value,
            context: context,
            isDark: isDark,
            theme: theme,
            image: 'assets/icons/facebook_icon.png',
            onTap: () async {
              await authController.facebookLogin();
            },
          ),
        ),
      ],
    );
  }
}
