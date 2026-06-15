import 'package:ai_chat/screens/assistant/widgets/tool_card.dart';
import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:ai_chat/widgets/custom_app_padding.dart';
import 'package:flutter/material.dart';

class AssistantScreen extends StatelessWidget {
  const AssistantScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: AppPadding(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Title
              Text(
                "Assistant",
                style: AppTextStyle.h1.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),

              /// Subtitle
              Text(
                "Your AI Power Tools",
                style: AppTextStyle.bodySmall.copyWith(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 25),

              /// Tools Title
              Text(
                "Tools",
                style: AppTextStyle.bodySmall.copyWith(
                  color: Theme.of(context).textTheme.bodySmall?.color,
                  fontSize: 18,
                ),
              ),

              SizedBox(height: 15),

              /// Tool Card
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 15,
                  crossAxisSpacing: 15,
                  childAspectRatio: 1.2,

                  children: [
                    ToolCard(
                      title: "AI Chat",
                      subTitle: 'Smart convertion\nwith AI',
                      icon: Icons.psychology,
                      color: AppColors.primaryPurple,
                    ),

                    ToolCard(
                      title: "Image Generator",
                      subTitle: 'Smart convertion\nwith AI',
                      icon: Icons.image,
                      color: AppColors.primaryGreen,
                    ),

                    ToolCard(
                      title: "Code Explainer",
                      subTitle: 'Smart convertion\nwith AI',
                      icon: Icons.code,
                      color: Colors.amber,
                    ),

                    ToolCard(
                      title: "Summarizer",
                      subTitle: 'Smart convertion\nwith AI',
                      icon: Icons.description,
                      color: AppColors.blueGlow,
                    ),

                    ToolCard(
                      title: "Translator",
                      subTitle: 'Smart convertion\nwith AI',
                      icon: Icons.translate,
                      color: Colors.pink,
                    ),

                    ToolCard(
                      title: "Grammar Checker",
                      subTitle: 'Smart convertion\nwith AI',
                      icon: Icons.spellcheck,
                      color: Colors.green,
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
