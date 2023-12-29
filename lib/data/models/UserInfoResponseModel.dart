// To parse this JSON data, do
//
//     final userInfoResponseModel = userInfoResponseModelFromJson(jsonString);

import 'dart:convert';

UserInfoResponseModel userInfoResponseModelFromJson(String str) =>
    UserInfoResponseModel.fromJson(json.decode(str));

String userInfoResponseModelToJson(UserInfoResponseModel data) =>
    json.encode(data.toJson());

class UserInfoResponseModel {
  String body;
  List<ChatHistory> chatHistory;
  String eyecolor;
  String girlName;
  String haircolor;
  String imageUrl;
  String password;
  String personality;
  String skin;
  String species;
  String userCallName;
  String userName;

  UserInfoResponseModel({
    required this.body,
    required this.chatHistory,
    required this.eyecolor,
    required this.girlName,
    required this.haircolor,
    required this.imageUrl,
    required this.password,
    required this.personality,
    required this.skin,
    required this.species,
    required this.userCallName,
    required this.userName,
  });

  factory UserInfoResponseModel.fromJson(Map<String, dynamic> json) =>
      UserInfoResponseModel(
        body: json["body"],
        chatHistory: List<ChatHistory>.from(
            json["chatHistory"].map((x) => ChatHistory.fromJson(x))),
        eyecolor: json["eyecolor"],
        girlName: json["girlName"],
        haircolor: json["haircolor"],
        imageUrl: json["imageUrl"],
        password: json["password"],
        personality: json["personality"],
        skin: json["skin"],
        species: json["species"],
        userCallName: json["userCallName"],
        userName: json["userName"],
      );

  Map<String, dynamic> toJson() => {
        "body": body,
        "chatHistory": List<dynamic>.from(chatHistory.map((x) => x.toJson())),
        "eyecolor": eyecolor,
        "girlName": girlName,
        "haircolor": haircolor,
        "imageUrl": imageUrl,
        "password": password,
        "personality": personality,
        "skin": skin,
        "species": species,
        "userCallName": userCallName,
        "userName": userName,
      };
}

class ChatHistory {
  String content;
  String role;

  ChatHistory({
    required this.content,
    required this.role,
  });

  factory ChatHistory.fromJson(Map<String, dynamic> json) => ChatHistory(
        content: json["content"],
        role: json["role"],
      );

  Map<String, dynamic> toJson() => {
        "content": content,
        "role": role,
      };
}
