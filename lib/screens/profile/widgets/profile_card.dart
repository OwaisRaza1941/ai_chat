import 'package:ai_chat/utils/style/text_style.dart';
import 'package:flutter/material.dart';

class ProfileCard extends StatelessWidget {
  final bool isDark;
  const ProfileCard({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(25),
        border: isDark ? null : Border.all(color: Color(0xff7C3AED)),
        boxShadow: isDark
            ? null
            : [
                BoxShadow(
                  color: Color(0xff7C3AED).withOpacity(.25),
                  blurRadius: 25,
                ),
              ],
      ),

      /// Profile Info
      child: Column(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage("assets/logos/logo.png"),
          ),
          SizedBox(height: 15),

          Text(
            "Owais Raza",
            style: AppTextStyle.bodyLarge.copyWith(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5),

          Text(
            "Flutter Developer",
            style: AppTextStyle.bodyLarge.copyWith(
              color: Theme.of(context).textTheme.bodySmall?.color,
            ),
          ),
        ],
      ),
    );
  }
}
