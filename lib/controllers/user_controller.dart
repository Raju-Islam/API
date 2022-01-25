import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_comments/models/user.dart';
import 'package:get_comments/utils/app_constants.dart';

import 'package:http/http.dart' as http;

var client = http.Client();

class UserController extends GetxController {
  List<User> allUser = [];
  bool isLoading = false;
  Future<String> getUser() async {
    isLoading = true;
    update();
    try {
      http.Response response = await client.get(
        Uri.parse(AppConstants.baseUrl2 + AppConstants.getUsers + "?page=2"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        if (kDebugMode) {
          print(result['data']);
        }
        allUser.clear();
        result['data'].forEach((userData) {
          allUser.add(User.fromMap(userData));
        });

        if (kDebugMode) {
          print(allUser);
        }
      }
      isLoading = false;
      update();
      return response.body.toString();
    } finally {}
  }
}

final userController = Get.put(UserController());
