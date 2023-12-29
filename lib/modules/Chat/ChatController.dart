// ignore_for_file: file_names

import 'package:chat_app/data/models/UserInfoResponseModel.dart';
import 'package:chat_app/data/network/api/AddMessageApi.dart';
import 'package:chat_app/data/network/api/GetHistoryApi.dart';
import 'package:chat_app/data/network/api/GetUserInfoApi.dart';
import 'package:chat_app/data/network/services/database_adapter.dart';
import 'package:chat_app/data/network/services/hive_service.dart';
import 'package:chat_app/shared/constants/colors.dart';
import 'package:chat_app/shared/widgets/chat_buble.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  final DatabaseAdapter adapter = HiveService();

  final ScrollController scrollController = ScrollController();

  final TextEditingController msg = TextEditingController();

  final RxList<ChatBuble> messages = <ChatBuble>[].obs;
  final RxList<UserInfoResponseModel> userInfo = <UserInfoResponseModel>[].obs;

  final RxBool msgLoading = false.obs;
  final RxBool infoLoading = false.obs;

  final RxString msgValue = "".obs;

  @override
  Future<void> onInit() async {
    await getUserInfo();
    await getAllMessages();
    super.onInit();
  }

  // MESAJ GÖNDERME
  void sendMessage(String msgs, Color color, RxList<ChatBuble> messages) {
    ChatBuble message = ChatBuble(
      avatarColor: color,
      text: msgs,
      sender: userInfo.first.userName,
      messageBubbleColor: color,
    );
    messages.insert(0, message);
  }

  // AI'DAN GELEN MESAJI EKRANA YAZDIRMA
  void getMessageFromAI(
      {required String msg, required RxList<ChatBuble> messages}) {
    ChatBuble message = ChatBuble(
      text: msg,
      sender: userInfo.first.girlName,
      messageBubbleColor: AppColors.ZIMA_BLUE,
      isAI: true,
    );
    messages.insert(0, message);
  }

  // CHAT EKRANINDA MESAJ GÖNDERME
  Future<void> handleChat() async {
    final List<String> auth = await adapter.getAuth();
    if (msg.text.isEmpty) return;
    msgLoading.toggle();
    msg.text.isNotEmpty
        ? sendMessage(msg.text, AppColors.ZIMA_BLUE, messages)
        : null;
    scrollController.animateTo(
      scrollController.position.minScrollExtent,
      duration: const Duration(
        milliseconds: 300,
      ),
      curve: Curves.easeInOut,
    );
    msg.clear();
    final Map<String, String> data = {
      "userName": auth.first,
      "content": msgValue.value,
    };
    final AddMessageApi addMessageApi = AddMessageApi();
    try {
      await addMessageApi.addMessage(data: data).then((resp) {
        if (resp.statusCode == 200) {
          getMessageFromAI(msg: resp.data["ai_message"], messages: messages);
        }
      });
    } catch (e) {
      msgLoading.toggle();
      print("Chatting error: $e");
    } finally {
      msgLoading.toggle();
    }
  }

  // TÜM MESAJLARI GETİRME
  Future<void> getAllMessages() async {
    msgLoading.toggle();
    final List<String> auth = await adapter.getAuth();
    final Map<String, String> data = {
      "userName": auth.first,
    };
    final GetHistoryApi getHistoryApi = GetHistoryApi();
    try {
      await getHistoryApi.getHistory(data: data).then((resp) async {
        if (resp.statusCode == 200) {
          for (var item in resp.data["history"]) {
            if (item["role"] == "user") {
              sendMessage(item["content"], AppColors.ZIMA_BLUE, messages);
            } else if (item["role"] == "assistant") {
              getMessageFromAI(msg: item["content"], messages: messages);
            }
          }
        } else {
          print("Get all messages error: ${resp.statusCode}");
        }
      });
    } catch (e) {
      msgLoading.toggle();
      print("Get all messages error: $e");
    } finally {
      msgLoading.toggle();
    }
  }

  // KULLANICI BİLGİLERİNİ GETİRME
  Future<void> getUserInfo() async {
    infoLoading.toggle();
    final List<String> auth = await adapter.getAuth();
    final Map<String, String> data = {
      "userName": auth.first,
    };
    final GetUserInfoApi getUserInfoApi = GetUserInfoApi();
    try {
      await getUserInfoApi.getInfo(data: data).then((resp) {
        if (resp.statusCode == 200) {
          userInfo.add(UserInfoResponseModel.fromJson(resp.data["info"]));
        } else {
          print("Get all messages error: ${resp.statusCode}");
        }
      });
    } catch (e) {
      infoLoading.toggle();
      print("Get all messages error: $e");
    } finally {
      infoLoading.toggle();
    }
  }
}
