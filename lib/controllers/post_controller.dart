import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_comments/models/post.dart';
import 'package:get_comments/utils/app_constants.dart';

import 'package:http/http.dart' as http;

final client = http.Client();

class PostController extends GetxController {
  List<Post> allPost = [];
  bool isLoading = false;
  Future<String> getPost() async {
    isLoading = true;
    update();
    http.Response response = await client.get(
      Uri.parse(AppConstants.baseUrl + AppConstants.getPosts),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      // var post = jsonDecode(response.body);
      allPost.clear();
      allPost.addAll(postFromJson(response.body));
      if (kDebugMode) {
        print(allPost);
      }
      if (kDebugMode) {
        print("Get All post api is called");
      }
      //print(post);
    }
    isLoading = false;
    update();
    return response.body.toString();
  }
}
