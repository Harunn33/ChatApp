// ignore_for_file: file_names

import 'package:chat_app/modules/Splash/SplashController.dart';
import 'package:chat_app/shared/constants/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Splash extends GetView<SplashController> {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Chat App',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
            Obx(
              () => controller.isLoading.value
                  ? const CircularProgressIndicator(
                      color: AppColors.BLACK,
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
