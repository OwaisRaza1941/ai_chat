import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final String? errorText;
  final bool showSuccess;
  final bool obscureText;
  final IconData? prefixIcon;
  final VoidCallback? onTogglePassword;
  final Function(String)? onChanged;

  const AuthTextField({
    super.key,
    required this.hintText,
    required this.controller,
    this.errorText,
    this.showSuccess = false,
    this.obscureText = false,
    this.prefixIcon,
    this.onTogglePassword,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 50,
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(15),
            border: isDark ? null : Border.all(color: theme.dividerColor),
          ),
          child: TextField(
            onChanged: onChanged,
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 14),
              hintText: hintText,
              prefixIcon: Icon(
                prefixIcon,
                color: isDark ? AppColors.iconInactive : Colors.grey,
              ),
              suffixIcon: showSuccess
                  ? Icon(Icons.check_circle, color: Colors.green)
                  : onTogglePassword != null
                  ? IconButton(
                      onPressed: onTogglePassword,
                      icon: Icon(
                        obscureText ? Icons.visibility_off : Icons.visibility,
                      ),
                    )
                  : null,
            ),
          ),
        ),

        if (errorText != null && errorText!.isNotEmpty)
          Padding(
            padding: EdgeInsets.only(top: 5, left: 8),
            child: Text(
              errorText!,
              style: TextStyle(color: Colors.red, fontSize: 12),
            ),
          ),
      ],
    );
  }
}
