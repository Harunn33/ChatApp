// ignore_for_file: file_names

import 'package:chat_app/modules/Signin/SigninController.dart';
import 'package:get/get.dart';

class SigninBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SigninController>(() => SigninController());
  }
}
