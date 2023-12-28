// ignore_for_file: file_names

import 'package:chat_app/modules/Signup/SignupController.dart';
import 'package:get/get.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(() => SignupController());
  }
}
