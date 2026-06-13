import 'package:ai_chat/model/chat_model.dart';
import 'package:ai_chat/model/chat_room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatServices {
  final FirebaseFirestore _db = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String get uid => _auth.currentUser!.uid;

  Future<String> createChatRoom() async {
    final doc = _db.collection('users').doc(uid).collection('chats').doc();
    return doc.id;
  }

  Stream<List<ChatRoom>> getChats() {
    final uid = _auth.currentUser!.uid;

    return _db
        .collection('users')
        .doc(uid)
        .collection('chats')
        .orderBy('updatedAt', descending: true)
        .snapshots()
        .map((snap) {
          return snap.docs.map((doc) {
            return ChatRoom.fromJson(doc.data(), doc.id);
          }).toList();
        });
  }

  /// SEND MESSAGE
  Future<void> sendMessage(String chatId, ChatMessage message) async {
    final uid = _auth.currentUser!.uid;

    await _db
        .collection('users')
        .doc(uid)
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .doc(message.id)
        .set(message.toJson());

    /// 🔥 update chat room summary
    await _db
        .collection('users')
        .doc(uid)
        .collection('chats')
        .doc(chatId)
        .update({
          "lastMessage": message.text,
          "updatedAt": message.time.toIso8601String(),
        });
  }

  /// STREAM MESSAGES
  Stream<List<ChatMessage>> getMessages(String chatId) {
    final uid = _auth.currentUser!.uid;

    return _db
        .collection('users')
        .doc(uid)
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('time')
        .snapshots()
        .map(
          (snap) =>
              snap.docs.map((e) => ChatMessage.fromJson(e.data())).toList(),
        );
  }

  Future<void> createChatMetadata(String chatId, String firstMessage) async {
    await _db.collection('users').doc(uid).collection('chats').doc(chatId).set({
      "title": firstMessage.length > 30
          ? firstMessage.substring(0, 30)
          : firstMessage,
      "lastMessage": firstMessage,
      "updatedAt": DateTime.now().toIso8601String(),
    });
  }
}
