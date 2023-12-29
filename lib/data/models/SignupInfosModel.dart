// To parse this JSON data, do
//
//     final signupInfosModel = signupInfosModelFromJson(jsonString);

// ignore_for_file: file_names

import 'dart:convert';

SignupInfosModel signupInfosModelFromJson(String str) =>
    SignupInfosModel.fromJson(json.decode(str));

String signupInfosModelToJson(SignupInfosModel data) =>
    json.encode(data.toJson());

class SignupInfosModel {
  List<String> skin;
  List<String> personality;
  List<String> body;
  List<String> species;
  List<String> haircolor;
  List<String> eyecolor;

  SignupInfosModel({
    required this.skin,
    required this.personality,
    required this.body,
    required this.species,
    required this.haircolor,
    required this.eyecolor,
  });

  factory SignupInfosModel.fromJson(Map<String, dynamic> json) =>
      SignupInfosModel(
        skin: List<String>.from(json["skin"].map((x) => x)),
        personality: List<String>.from(json["personality"].map((x) => x)),
        body: List<String>.from(json["body"].map((x) => x)),
        species: List<String>.from(json["species"].map((x) => x)),
        haircolor: List<String>.from(json["haircolor"].map((x) => x)),
        eyecolor: List<String>.from(json["eyecolor"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "skin": List<dynamic>.from(skin.map((x) => x)),
        "personality": List<dynamic>.from(personality.map((x) => x)),
        "body": List<dynamic>.from(body.map((x) => x)),
        "species": List<dynamic>.from(species.map((x) => x)),
        "haircolor": List<dynamic>.from(haircolor.map((x) => x)),
        "eyecolor": List<dynamic>.from(eyecolor.map((x) => x)),
      };
}
