import 'package:ai_chat/screens/explore/widgets/explore_cards.dart';
import 'package:ai_chat/utils/style/app_colors.dart';
import 'package:ai_chat/utils/style/text_style.dart';
import 'package:ai_chat/widgets/custom_app_padding.dart';
import 'package:ai_chat/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: AppPadding(
          bottom: 10,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Explore",
                style: AppTextStyle.h2.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              CustomTextfield(
                hinText: 'Search prompts',
                prefixIcon: Icons.search,
                color: Theme.of(context).cardColor,
              ),
              SizedBox(height: 25),

              Text(
                "Categories",
                style: AppTextStyle.h3.copyWith(
                  color: Theme.of(context).textTheme.bodyLarge?.color,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 15),

              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,

                  children: [
                    ExploreCard(
                      title: "AI Writing",
                      icon: Icons.edit,
                      iconColor: AppColors.blueGlow,
                    ),

                    ExploreCard(
                      title: "Code Helper",
                      icon: Icons.code,
                      iconColor: AppColors.blueGlow,
                    ),

                    ExploreCard(
                      title: "Translator",
                      icon: Icons.translate,
                      iconColor: AppColors.blueGlow,
                    ),

                    ExploreCard(
                      title: "Image Generator",
                      icon: Icons.image,
                      iconColor: AppColors.blueGlow,
                    ),

                    ExploreCard(
                      title: "Grammar",
                      icon: Icons.spellcheck,
                      iconColor: AppColors.blueGlow,
                    ),

                    ExploreCard(
                      title: "Travel Guide",
                      icon: Icons.flight,
                      iconColor: AppColors.blueGlow,
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
