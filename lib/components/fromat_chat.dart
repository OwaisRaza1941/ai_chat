import 'package:intl/intl.dart';

String formatChatTime(DateTime time) {
  final now = DateTime.now();
  final difference = now.difference(time);

  if (difference.inMinutes < 1) {
    return "Now";
  } else if (difference.inHours < 1) {
    return "${difference.inMinutes} min ago";
  } else if (difference.inDays == 0) {
    return "Today ${DateFormat('hh:mm a').format(time)}";
  } else if (difference.inDays == 1) {
    return "Yesterday ${DateFormat('hh:mm a').format(time)}";
  } else {
    return DateFormat('dd MMM yyyy').format(time);
  }
}
