class ChatMessage {
  final String id;
  final String text;
  final String role;
  final DateTime time;

  ChatMessage({
    required this.id,
    required this.text,
    required this.role,
    required this.time,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': text,
      'role': role,
      'time': time.toIso8601String(),
    };
  }

  factory ChatMessage.fromJson(Map<String, dynamic> json) {
    return ChatMessage(
      id: json['id'],
      text: json['text'],
      role: json['role'],
      time: DateTime.parse(json['time']),
    );
  }
}
