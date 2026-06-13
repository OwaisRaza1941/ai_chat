import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:flutter/material.dart';

Widget chatBubble({
  required String text,
  required bool isMe,
  required bool isDark,
}) {
  return Align(
    alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(12),
      constraints: BoxConstraints(maxWidth: 280),

      decoration: BoxDecoration(
        gradient: isMe
            ? LinearGradient(
                colors: [Color(0xFF8E7CFF), Color(0xFFB3A6FF)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              )
            : null,

        color: isMe ? null : (isDark ? AppColors.cardColor : Colors.white),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
          bottomLeft: isMe ? Radius.circular(16) : Radius.circular(4),
          bottomRight: isMe ? Radius.circular(4) : Radius.circular(16),
        ),

        boxShadow: isMe || isDark
            ? []
            : [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
      ),

      child: Text(
        text,
        style: TextStyle(
          color: isMe ? Colors.white : (isDark ? Colors.white : Colors.black87),
          fontSize: 14,
        ),
      ),
    ),
  );
}
