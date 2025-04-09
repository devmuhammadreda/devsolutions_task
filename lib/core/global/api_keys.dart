// ignore_for_file: deprecated_member_use

import 'dart:developer';

const String dummyImage = "https://picsum.photos/800";

class APIKeys {
  static String baseUrl = "https://fakestoreapi.com/";
  static String getProducts = "products";
}

String imagePath(String path) {
  log(APIKeys.baseUrl + path);
  return APIKeys.baseUrl + path;
}
