import 'package:ai_chat/utils/style/text_style.dart';
import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String time;

  const HistoryCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Color(0xff7C3AED).withOpacity(.10), blurRadius: 15),
        ],
      ),

      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Color(0xff7C3AED).withOpacity(.2),
          child: Icon(Icons.chat, color: Color(0xff7C3AED)),
        ),
        title: Text(
          title,
          style: AppTextStyle.bodyLarge.copyWith(
            color: Theme.of(context).textTheme.bodyLarge?.color,
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyle.bodyLarge.copyWith(
            color: Theme.of(context).textTheme.bodySmall?.color,
          ),
        ),

        trailing: Text(
          time,
          style: AppTextStyle.bodyLarge.copyWith(
            color: Theme.of(context).textTheme.bodySmall?.color,
          ),
        ),
      ),
    );
  }
}
