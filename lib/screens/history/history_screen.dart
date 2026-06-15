import 'package:ai_chat/screens/history/widgets/history_card.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:ai_chat/widgets/custom_app_padding.dart';
import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: AppPadding(
          bottom: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Heading
              Text(
                "History",
                style: AppTextStyle.h1.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                ),
              ),

              SizedBox(height: 20),

              /// History Chats
              Expanded(
                child: ListView(
                  children: [
                    HistoryCard(
                      title: "Flutter UI Ideas",
                      subtitle: "Suggest some UI ideas...",
                      time: "10:30 AM",
                    ),

                    HistoryCard(
                      title: "JavaScript Explanation",
                      subtitle: "Explain Closures...",
                      time: "Yesterday",
                    ),

                    HistoryCard(
                      title: "AI In Daily Life",
                      subtitle: "How AI is used...",
                      time: "2 Days Ago",
                    ),

                    HistoryCard(
                      title: "Code Debug Help",
                      subtitle: "Why code not working...",
                      time: "3 Days Ago",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
