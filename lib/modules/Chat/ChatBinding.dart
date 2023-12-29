// ignore_for_file: file_names

import 'package:chat_app/modules/Chat/ChatController.dart';
import 'package:get/get.dart';

class ChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChatController>(() => ChatController());
  }
}
