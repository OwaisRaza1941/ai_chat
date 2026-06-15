import 'package:ai_chat/components/scroll_bottom.dart';
import 'package:ai_chat/model/chat_model.dart';
import 'package:ai_chat/model/chat_room.dart';
import 'package:ai_chat/services/ai_chat_services.dart';
import 'package:ai_chat/services/chat_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  /// Chat Services
  final ChatServices _chatServices = ChatServices();

  /// AI Chat Services
  final AIChatServices _aiServices = AIChatServices();

  /// Chat ScrolllController automatically when recieve Ai Messge
  late ScrollController scrollController;

  @override
  void onInit() {
    super.onInit();
    scrollController = ScrollController();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }

  /// Is Loading
  RxBool isLoading = false.obs;

  /// Cnversion ID
  RxString conversationId = ''.obs;

  /// Start New Chat
  Future<void> startNewChat() async {
    conversationId.value = "";
  }

  /// Send Messege in Qroq and Data Save CLoud Firestore
  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    /// Check if Conversion id is empty autmatically create id
    if (conversationId.value.isEmpty) {
      final id = await _chatServices.createChatRoom();

      await _chatServices.createChatMetadata(id, text);

      conversationId.value = id;
    }

    //// Conversion id
    final chatId = conversationId.value;

    /// User Messge Model
    final userMsg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      role: "user",
      time: DateTime.now(),
    );

    /// User Messege Save Firebase Firestore And Auot Scrolle
    await _chatServices.sendMessage(chatId, userMsg);
    scrollToBottom(scrollController);

    //// Is Loading true
    isLoading.value = true;

    //// Send  Ai Messege
    final response = await _aiServices.sendMessage(text);
    isLoading.value = false;

    /// AI Messge Model
    final aiMsg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: response,
      role: "assistant",
      time: DateTime.now(),
    );

    /// Chat Services Send & save Messege
    await _chatServices.sendMessage(chatId, aiMsg);
    scrollToBottom(scrollController);
  }

  /// Get Messee In Time
  Stream<List<ChatMessage>> getMessages() {
    if (conversationId.value.isEmpty) {
      return Stream.value([]);
    }
    return _chatServices.getMessages(conversationId.value);
  }

  /// Get Chats
  Stream<List<ChatRoom>> getChats() {
    return _chatServices.getChats();
  }
}
