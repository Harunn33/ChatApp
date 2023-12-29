// ignore_for_file: file_names
import 'dart:io';
import 'dart:typed_data';

import 'package:chat_app/data/models/SignupInfosModel.dart';
import 'package:chat_app/data/models/SignupRequestModel.dart';
import 'package:chat_app/data/network/api/AddUserApi.dart';
import 'package:chat_app/data/network/services/database_adapter.dart';
import 'package:chat_app/data/network/services/hive_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final DatabaseAdapter adapter = HiveService();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController girlNameController = TextEditingController();
  final TextEditingController callNameController = TextEditingController();

  final RxBool isLoading = false.obs;

  final RxString skin = "".obs;
  final RxString personality = "".obs;
  final RxString body = "".obs;
  final RxString species = "".obs;
  final RxString haircolor = "".obs;
  final RxString eyecolor = "".obs;

  List<SignupInfosModel> infos = <SignupInfosModel>[
    SignupInfosModel(
      skin: [
        "White",
        "Black",
        "Yellow",
        "Red",
        "Green",
        "Blue",
        "Purple",
        "Brown",
        "Pink",
        "Orange",
      ],
      personality: [
        "Random",
        "Sweet",
        "Intelligent",
        "Mysterious",
        "Playful",
        "Obsessive",
        "Manipulative",
        "Devoted",
        "Protective",
        "Unstable",
      ],
      body: [
        "Random",
        "Fit",
        "Skinny",
        "Casual",
        "Muscular",
        "Thick",
        "Chubby",
      ],
      species: [
        "Random",
        "Human",
        "Elf",
        "Catgirl",
        "Demoness",
        "Angel",
        "Witch",
        "Sucubbus",
        "Fairy",
        "Oni",
      ],
      haircolor: [
        "Random",
        "Black",
        "Blonde",
        "Brown",
        "Red",
        "Pink",
        "Blue",
        "Green",
        "Purple",
        "Silver",
        "Yellow",
      ],
      eyecolor: [
        "Random",
        "Green",
        "Yellow",
        "Blue",
        "Brown",
        "Red",
        "Purple",
        "Pink",
        "Teal",
        "Silver",
      ],
    ),
  ];

  @override
  void onClose() {
    usernameController.dispose();
    passwordController.dispose();
    girlNameController.dispose();
    callNameController.dispose();
    super.onClose();
  }

  Future<void> saveImage({required String url}) async {
    File file = File(url);
    Uint8List bytes = await file.readAsBytes();
    File deneme = await DefaultCacheManager()
        .putFile(url, bytes, key: usernameController.text);
    print("deneme: ${deneme.toString()}");
    // adapter.storeImage(bytes, usernameController.text);
  }

  Future<List<Uint8List>> readImageFromDatabase() async {
    return adapter.getImages(usernameController.text);
  }

  Future<void> addUser() async {
    if (formKey.currentState!.validate()) {
      isLoading.toggle();
      final SignupRequestModel signupRequestModel = SignupRequestModel(
        userName: usernameController.text,
        password: passwordController.text,
        skin: skin.value,
        personality: personality.value,
        girlName: girlNameController.text,
        body: body.value,
        species: species.value,
        haircolor: haircolor.value,
        eyecolor: eyecolor.value,
        userCallName: callNameController.text,
      );
      final AddUserApi addUserApi = AddUserApi();
      try {
        await addUserApi
            .addUser(data: signupRequestModel.toJson())
            .then((resp) async {
          print("AddUserApi response: ${resp.statusCode.toString()}");
          print("AddUserApi response: ${resp.data.toString()}");
          if (resp.statusCode == 200) {
            Get.snackbar(
              "Success",
              "User added successfully",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.green,
              colorText: Colors.white,
            );
            Get.close(1);
          } else {
            Get.snackbar(
              "Error",
              "Something went wrong",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.red,
              colorText: Colors.white,
            );
          }
        });
      } catch (e) {
        isLoading.toggle();
        print("AddUserApi error: $e");
        return;
      } finally {
        isLoading.toggle();
      }
    }
  }
}
