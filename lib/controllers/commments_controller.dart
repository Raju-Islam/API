import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import 'package:get_comments/models/commets.dart';
import 'package:get_comments/utils/app_constants.dart';
import 'package:http/http.dart' as http;

var client = http.Client();

class CommentController extends GetxController {
  List<Comments> allComments = [];
  bool isLoading = false;
  Future<String> getAllComment() async {
    isLoading = true;
    update();
    try {
      http.Response response = await client.get(
        Uri.parse(
            AppConstants.baseUrl + AppConstants.getComments + "/1/comments"),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      );
      if (response.statusCode == 200) {
        // var res = jsonDecode(response.body);
        // print("respones: ${data}");
        // final comments = jsonDecode(response.body) as List;
        // comments.forEach((element) {
        //   allComments.add(Comments.fromJson(element));
        // });
        allComments.clear();
        allComments.addAll(commentsFromJson(response.body));
        if (kDebugMode) {
          print("Get All Comment is call");
          print(allComments);
        }
      }
      isLoading = false;
      update();
      return response.body.toString();
    } finally {}
  }
}
