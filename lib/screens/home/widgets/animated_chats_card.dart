import 'package:ai_chat/controller/chat_controller.dart';
import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:get/get.dart';

class AnimatedChatCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final String time;
  final String conversationId;

  const AnimatedChatCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.time,
    required this.conversationId,
  });

  @override
  State<AnimatedChatCard> createState() => _AnimatedChatCardState();
}

class _AnimatedChatCardState extends State<AnimatedChatCard>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 350),
    );

    animation = CurvedAnimation(parent: controller, curve: Curves.easeOut);

    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    //// ChatController
    final ChatController chatController = Get.find();

    return FadeTransition(
      opacity: animation,
      child: ScaleTransition(
        scale: animation,
        child: Container(
          margin: EdgeInsets.only(bottom: 10),
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: theme.cardColor,
            borderRadius: BorderRadius.circular(15),
          ),

          child: Row(
            children: [
              // ICON BOX
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.primaryPurple
                      : AppColors.primaryBlue,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Icon(widget.icon, color: Colors.white),
              ),

              SizedBox(width: 10),

              // TEXT SECTION
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: AppTextStyle.bodyMedium.copyWith(
                        color: theme.textTheme.bodyLarge?.color,
                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    SizedBox(height: 2),

                    Text(
                      widget.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: AppTextStyle.bodySmall.copyWith(
                        fontSize: 12,
                        fontWeight: FontWeight.w100,
                        color: isDark
                            ? Colors.grey.shade400
                            : Colors.grey.shade600,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(width: 10),

              // RIGHT SIDE
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    widget.time,
                    style: AppTextStyle.bodyMedium.copyWith(
                      color: isDark
                          ? Colors.grey.shade400
                          : Colors.grey.shade600,
                    ),
                  ),

                  SizedBox(height: 5),
                  IconButton(
                    style: IconButton.styleFrom(padding: EdgeInsets.zero),
                    onPressed: () {
                      chatController.deleteChat(widget.conversationId);
                    },
                    icon: Icon(
                      Icons.more_vert,
                      size: 18,
                      color: isDark
                          ? Colors.grey.shade400
                          : Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
