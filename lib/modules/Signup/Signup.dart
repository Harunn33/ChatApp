// ignore_for_file: file_names, must_be_immutable
import 'package:chat_app/modules/Signup/SignupController.dart';
import 'package:chat_app/shared/constants/colors.dart';
import 'package:chat_app/shared/extensions/spacer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bounceable/flutter_bounceable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Signup extends GetView<SignupController> {
  const Signup({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Signup',
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                color: AppColors.BLACK,
              ),
        ),
      ),
      body: SingleChildScrollView(
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
                    CustomInput(
                      controller: controller.girlNameController,
                      label: "Girl Name",
                    ),
                    Direction.vertical.spacer(10),
                    CustomInput(
                      controller: controller.callNameController,
                      label: "Call Name",
                    ),
                    Direction.vertical.spacer(10),
                    CustomDropdownButtonFormField(
                      hint: "Choose a skin",
                      dropdownValue: controller.skin,
                      label: "Skin",
                      list: controller.infos.first.skin,
                    ),
                    Direction.vertical.spacer(10),
                    CustomDropdownButtonFormField(
                      hint: "Choose a personality",
                      dropdownValue: controller.personality,
                      label: "Personality",
                      list: controller.infos.first.personality,
                    ),
                    Direction.vertical.spacer(10),
                    CustomDropdownButtonFormField(
                      hint: "Choose a body",
                      dropdownValue: controller.body,
                      label: "Body",
                      list: controller.infos.first.body,
                    ),
                    Direction.vertical.spacer(10),
                    CustomDropdownButtonFormField(
                      hint: "Choose a species",
                      dropdownValue: controller.species,
                      label: "Species",
                      list: controller.infos.first.species,
                    ),
                    Direction.vertical.spacer(10),
                    CustomDropdownButtonFormField(
                      hint: "Choose a hair color",
                      dropdownValue: controller.haircolor,
                      label: "Hair Color",
                      list: controller.infos.first.haircolor,
                    ),
                    Direction.vertical.spacer(10),
                    CustomDropdownButtonFormField(
                      hint: "Choose an eye color",
                      dropdownValue: controller.eyecolor,
                      label: "Eye Color",
                      list: controller.infos.first.eyecolor,
                    ),
                    Direction.vertical.spacer(10),
                    Obx(
                      () => Bounceable(
                        onTap: controller.isLoading.value
                            ? null
                            : () => controller.addUser(),
                        child: Container(
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: EdgeInsets.symmetric(vertical: 10.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.sp),
                            color: AppColors.ZIMA_BLUE,
                          ),
                          child: controller.isLoading.value
                              ? const CircularProgressIndicator(
                                  color: AppColors.WHITE,
                                )
                              : Text(
                                  "Create Account",
                                  style: Theme.of(context).textTheme.labelLarge,
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
    );
  }
}

class CustomDropdownButtonFormField extends StatelessWidget {
  final List<String> list;
  final String label;
  final RxString dropdownValue;
  final String hint;
  const CustomDropdownButtonFormField({
    super.key,
    required this.list,
    required this.label,
    required this.dropdownValue,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      menuMaxHeight: 300.h,
      value: dropdownValue.value.isEmpty ? null : dropdownValue.value,
      hint: Text(hint),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please ${hint.toLowerCase()}";
        }
        return null;
      },
      decoration: InputDecoration(
        label: Text(label),
        border: const OutlineInputBorder(),
      ),
      items: list
          .map(
            (e) => DropdownMenuItem(
              value: e,
              child: Text(e),
            ),
          )
          .toList(),
      onChanged: (val) {
        if (val == null) return;
        dropdownValue.value = val.toString();
      },
    );
  }
}

class CustomInput extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final bool isPassword;
  const CustomInput({
    super.key,
    required this.controller,
    required this.label,
    this.isPassword = false,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "Please enter ${label.toLowerCase()}";
        }
        return null;
      },
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      obscureText: isPassword,
      obscuringCharacter: "*",
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
      ),
    );
  }
}
