// ignore_for_file: file_names

import 'package:chat_app/data/network/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class GetUserInfoApi {
  final ApiService _apiService = ApiService();
  Future<Response> getInfo({required Map<String, dynamic> data}) async {
    try {
      final Response resp = await _apiService.post(
        dotenv.env["GET_USER_INFO_URL"].toString(),
        data: data,
      );
      return resp;
    } catch (e) {
      rethrow;
    }
  }
}
