import 'package:ai_chat/controller/auth_controller.dart';
import 'package:ai_chat/controller/chat_controller.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController(), permanent: true);
    Get.put(ChatController(), permanent: true);
  }
}
