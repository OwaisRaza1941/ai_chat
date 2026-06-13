import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:flutter/material.dart';

class LogoutDialoge extends StatelessWidget {
  final VoidCallback onPressed;
  const LogoutDialoge({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Dialog(
      
      backgroundColor: isDark ? AppColors.cardColor : AppColors.whiteText,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Logout",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 10),

            Text("Are you sure you want to logout?"),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel"),
                ),
                ElevatedButton(onPressed: onPressed, child: Text("Logout")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
