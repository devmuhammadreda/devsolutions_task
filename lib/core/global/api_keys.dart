// ignore_for_file: deprecated_member_use

import 'dart:developer';

import '../services/network_service.dart/dio_network_service.dart';

const String dummyImage = "https://picsum.photos/800";
final NetworkService networkService = NetworkService(baseUrl: APIKeys.baseUrl);

class APIKeys {
  static String baseUrl = "";
}

String imagePath(String path) {
  log(APIKeys.baseUrl + path);
  return APIKeys.baseUrl + path;
}
