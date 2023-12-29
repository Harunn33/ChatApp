// ignore_for_file: file_names

import 'package:chat_app/modules/Splash/SplashController.dart';
import 'package:get/get.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<SplashController>(SplashController());
  }
}
