import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_comments/models/resource.dart';
import 'package:get_comments/utils/app_constants.dart';
import 'package:http/http.dart' as http;

var client = http.Client();

class ResourceController extends GetxController {
  List<Resource> allResource = [];
  bool isLoading = false;
  Future<String> getAllResource() async {
    isLoading = true;
    update();
    http.Response response = await client.get(
      Uri.parse(AppConstants.baseUrl2 + AppConstants.getResource),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      var result = jsonDecode(response.body);
      allResource.clear();
      result['data'].forEach(
        (resourceData) {
          allResource.add(
            Resource.fromJson(resourceData),
          );
        },
      );
      if (kDebugMode) {
        print(allResource);
      }
    } else {
      if (kDebugMode) {
        print('error');
      }
    }
    isLoading = false;
    update();
    return response.body.toString();
  }
}
