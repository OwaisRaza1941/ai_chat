class ChatRoom {
  final String id;
  final String title;
  final String lastMessage;
  final DateTime updatedAt;

  ChatRoom({
    required this.id,
    required this.title,
    required this.lastMessage,
    required this.updatedAt,
  });

  factory ChatRoom.fromJson(Map<String, dynamic> json, String id) {
    return ChatRoom(
      id: id,
      title: json['title'] ?? "New Chat",
      lastMessage: json['lastMessage'] ?? "",
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "title": title,
      "lastMessage": lastMessage,
      "updatedAt": updatedAt.toIso8601String(),
    };
  }
}
