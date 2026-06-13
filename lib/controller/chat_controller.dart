import 'package:ai_chat/components/scroll_bottom.dart';
import 'package:ai_chat/model/chat_model.dart';
import 'package:ai_chat/model/chat_room.dart';
import 'package:ai_chat/services/ai_chat_services.dart';
import 'package:ai_chat/services/chat_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final ChatServices _chatServices = ChatServices();
  final AIChatServices _aiServices = AIChatServices();

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

  RxBool isLoading = false.obs;

  RxString conversationId = ''.obs;

  Future<void> startNewChat() async {
    conversationId.value = "";
  }

  Future<void> sendMessage(String text) async {
    if (text.trim().isEmpty) return;

    if (conversationId.value.isEmpty) {
      final id = await _chatServices.createChatRoom();

      await _chatServices.createChatMetadata(id, text);

      conversationId.value = id;
    }

    final chatId = conversationId.value;

    final userMsg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: text,
      role: "user",
      time: DateTime.now(),
    );

    await _chatServices.sendMessage(chatId, userMsg);
    scrollToBottom(scrollController);

    isLoading.value = true;

    final response = await _aiServices.sendMessage(text);
    isLoading.value = false;
    final aiMsg = ChatMessage(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      text: response,
      role: "assistant",
      time: DateTime.now(),
    );

    await _chatServices.sendMessage(chatId, aiMsg);
    scrollToBottom(scrollController);
  }

  Stream<List<ChatMessage>> getMessages() {
    if (conversationId.value.isEmpty) {
      return Stream.value([]);
    }

    return _chatServices.getMessages(conversationId.value);
  }

  Stream<List<ChatRoom>> getChats() {
    return _chatServices.getChats();
  }
}
