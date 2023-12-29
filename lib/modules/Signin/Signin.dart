// ignore_for_file: file_names

import 'package:chat_app/modules/Signin/SigninController.dart';
import 'package:chat_app/modules/Signup/index.dart';
import 'package:chat_app/routes/app_pages.dart';
import 'package:chat_app/shared/constants/colors.dart';
import 'package:chat_app/shared/extensions/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Signin extends GetView<SigninController> {
  const Signin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Signin',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.BLACK,
              ),
        ),
      ),
      body: WillPopScope(
        onWillPop: () async => false,
        child: SingleChildScrollView(
          physics: const ClampingScrollPhysics(),
          child: Padding(
            padding:
                EdgeInsets.symmetric(horizontal: 20.w).copyWith(bottom: 30.h),
            child: Column(
              children: [
                Direction.vertical.spacer(30),
                Text(
                  'Chat App',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Direction.vertical.spacer(30),
                Form(
                  key: controller.formKey,
                  child: Column(
                    children: [
                      CustomInput(
                        controller: controller.usernameController,
                        label: "Username",
                      ),
                      Direction.vertical.spacer(10),
                      CustomInput(
                        controller: controller.passwordController,
                        label: "Password",
                        isPassword: true,
                      ),
                      Direction.vertical.spacer(10),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: () => Get.toNamed(Routes.SIGNUP),
                          child: Text(
                            "You don't have an account?",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ),
                      ),
                      Direction.vertical.spacer(10),
                      Obx(
                        () => Bounceable(
                          onTap: controller.isLoading.value
                              ? null
                              : () => controller.handleSignin(),
                          child: Container(
                            width: double.infinity,
                            alignment: Alignment.center,
                            padding: const EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3.sp),
                              color: AppColors.ZIMA_BLUE,
                            ),
                            child: controller.isLoading.value
                                ? const CircularProgressIndicator(
                                    color: AppColors.WHITE,
                                  )
                                : Text(
                                    "Signin",
                                    style:
                                        Theme.of(context).textTheme.labelLarge,
                                  ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
