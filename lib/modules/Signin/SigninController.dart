// ignore_for_file: file_names

import 'package:chat_app/data/network/api/SigninApi.dart';
import 'package:chat_app/data/network/services/database_adapter.dart';
import 'package:chat_app/data/network/services/hive_service.dart';
import 'package:chat_app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final DatabaseAdapter adapter = HiveService();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isLoading = false.obs;

  // GİRİŞ YAPMA
  Future<void> handleSignin() async {
    if (formKey.currentState!.validate()) {
      isLoading.toggle();

      final Map<String, String> data = {
        "userName": usernameController.text,
        "password": passwordController.text,
      };
      final SigninApi signinApi = SigninApi();
      try {
        await signinApi.handleSignin(data: data).then((resp) {
          if (resp.statusCode == 200) {
            adapter.storeAuth(usernameController.text, passwordController.text);
            Get.toNamed(Routes.CHAT);
          } else {
            Get.snackbar(
              "Error",
              "Something went wrong",
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        });
      } catch (e) {
        isLoading.toggle();
        print("handleSignin error: $e");
      } finally {
        isLoading.toggle();
      }
    }
  }
}
