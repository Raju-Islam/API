import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_comments/models/response/create_post_response.dart';
import 'package:get_comments/utils/app_constants.dart';
import 'package:http/http.dart' as http;

class PostCreateController extends GetxController {
  var client = http.Client();
  List<PostResponse> allPost = [];
  Future<bool> postCreate(PostResponse post) async {
    print(postResponseToJson(post));
    http.Response response = await client.post(
      Uri.parse(AppConstants.baseUrl2 + AppConstants.getPostResponse),
      body: postResponseToJson(post),
    );
    print(response.statusCode);
    print("response : " + response.body);
    if (response.statusCode == 201) {
      if (kDebugMode) {
        print(response.body);
      }
      allPost.add(
        postResponseFromJson(response.body),
      );
      if (kDebugMode) {
        print(allPost);
      }
    }
    update();
    return true;
  }

  delete(int index) {
    allPost.removeAt(index);
    update();
  }
}
