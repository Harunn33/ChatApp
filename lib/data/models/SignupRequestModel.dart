// To parse this JSON data, do
//
//     final signupRequestModel = signupRequestModelFromJson(jsonString);

import 'dart:convert';

SignupRequestModel signupRequestModelFromJson(String str) =>
    SignupRequestModel.fromJson(json.decode(str));

String signupRequestModelToJson(SignupRequestModel data) =>
    json.encode(data.toJson());

class SignupRequestModel {
  String userName;
  String password;
  String skin;
  String personality;
  String girlName;
  String body;
  String species;
  String haircolor;
  String eyecolor;
  String userCallName;

  SignupRequestModel({
    required this.userName,
    required this.password,
    required this.skin,
    required this.personality,
    required this.girlName,
    required this.body,
    required this.species,
    required this.haircolor,
    required this.eyecolor,
    required this.userCallName,
  });

  factory SignupRequestModel.fromJson(Map<String, dynamic> json) =>
      SignupRequestModel(
        userName: json["userName"],
        password: json["password"],
        skin: json["skin"],
        personality: json["personality"],
        girlName: json["girlName"],
        body: json["body"],
        species: json["species"],
        haircolor: json["haircolor"],
        eyecolor: json["eyecolor"],
        userCallName: json["userCallName"],
      );

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "skin": skin,
        "personality": personality,
        "girlName": girlName,
        "body": body,
        "species": species,
        "haircolor": haircolor,
        "eyecolor": eyecolor,
        "userCallName": userCallName,
      };
}
