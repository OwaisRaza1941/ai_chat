import 'package:ai_chat/utils/style/text_style.dart';
import 'package:flutter/material.dart';
import 'package:ai_chat/utils/style/app_colors.dart';

class AppTheme {
  // ================= LIGHT THEME =================
  static final lightTheme = ThemeData(
    brightness: Brightness.light,

    scaffoldBackgroundColor: Colors.white,

    primaryColor: AppColors.primaryBlue,

    dividerColor: Colors.grey.shade300,

    colorScheme: ColorScheme.light(
      primary: AppColors.primaryBlue,
      secondary: AppColors.primaryPurple,
      background: Colors.white,
      surface: Colors.white,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 0,
    ),

    textTheme: TextTheme(
      bodyLarge: TextStyle(color: Colors.black),
      bodyMedium: TextStyle(color: Colors.black87),
      bodySmall: TextStyle(color: Colors.black54),
    ),

    iconTheme: IconThemeData(color: Colors.black54),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: Colors.grey),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.white,
      selectedItemColor: AppColors.primaryBlue,
      unselectedItemColor: Colors.grey,
    ),
  );

  // ================= DARK THEME =================
  static final darkTheme = ThemeData(
    brightness: Brightness.dark,

    scaffoldBackgroundColor: AppColors.background,

    primaryColor: AppColors.primaryPurple,

    cardColor: AppColors.cardColor,

    dividerColor: AppColors.cardBorder,

    colorScheme: ColorScheme.dark(
      primary: AppColors.primaryPurple,
      secondary: AppColors.primaryBlue,
      background: AppColors.background,
      surface: AppColors.cardColor,
    ),

    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.backgroundSecondary,
      foregroundColor: AppColors.whiteText,
      elevation: 0,
    ),

    textTheme: TextTheme(
      bodyLarge: AppTextStyle.bodyLarge.copyWith(color: AppColors.whiteText),
      bodyMedium: AppTextStyle.bodyMedium.copyWith(
        color: AppColors.lightGreyText,
      ),
      bodySmall: AppTextStyle.bodySmall.copyWith(color: AppColors.greyText),
    ),

    iconTheme: IconThemeData(color: AppColors.iconColor),

    inputDecorationTheme: InputDecorationTheme(
      hintStyle: TextStyle(color: AppColors.lightGreyText),
      filled: true,
      fillColor: AppColors.cardColor,

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(15),
        borderSide: BorderSide.none,
      ),
    ),

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.cardColor,
      selectedItemColor: AppColors.primaryPurple,
      unselectedItemColor: AppColors.iconInactive,
    ),
  );
}
