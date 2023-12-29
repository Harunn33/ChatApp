// ignore_for_file: file_names

import 'package:chat_app/data/network/services/database_adapter.dart';
import 'package:chat_app/data/network/services/hive_service.dart';
import 'package:chat_app/routes/app_pages.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  final DatabaseAdapter adapter = HiveService();

  final RxBool isLoading = false.obs;

  @override
  void onInit() {
    redirect();
    super.onInit();
  }

  Future<void> redirect() async {
    isLoading.toggle();
    await Future.delayed(const Duration(seconds: 2), () async {
      final result = await adapter.getAuth();
      if (result.first.isNotEmpty && result.last.isNotEmpty) {
        Get.toNamed(Routes.CHAT);
        isLoading.toggle();
      } else {
        isLoading.toggle();
        Get.toNamed(Routes.SIGNIN);
      }
    });
  }
}
