import 'package:ai_chat/model/chat_model.dart';
import 'package:ai_chat/model/chat_room.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatServices {
  //// Firebase CLoud Firestore Instance
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  /// Firebase Authentication INstance
  final FirebaseAuth _auth = FirebaseAuth.instance;

  /// Get Current User id,
  String get uid => _auth.currentUser!.uid;

  /// Create Chat Room
  Future<String> createChatRoom() async {
    /// Generate Automatically Id Firestore
    final doc = _db.collection('users').doc(uid).collection('chats').doc();
    return doc.id;
  }

  /// Get Chats
  Stream<List<ChatRoom>> getChats() {
    /// Get Current User UID;
    final uid = _auth.currentUser!.uid;

    /// Get Chats
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
    /// Get Current User UID;
    final uid = _auth.currentUser!.uid;

    /// Save Messege in Firestore
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
    /// Get Current User UID;
    final uid = _auth.currentUser!.uid;

    /// Get Messges
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

  /// Create Chat Meta Data
  Future<void> createChatMetadata(String chatId, String firstMessage) async {
    /// Create Chat Meta Data
    await _db.collection('users').doc(uid).collection('chats').doc(chatId).set({
      "title": firstMessage.length > 30
          ? firstMessage.substring(0, 30)
          : firstMessage,
      "lastMessage": firstMessage,
      "updatedAt": DateTime.now().toIso8601String(),
    });
  }

  /// Delete Chat
  Future<void> deleteChat(String conversationId) async {
    try {
      /// Get Current User UID;
      final uid = _auth.currentUser!.uid;
      await _db
          .collection('users')
          .doc(uid)
          .collection('chats')
          .doc(conversationId)
          .delete();
    } on FirebaseException {
      rethrow;
    }
  }
}
