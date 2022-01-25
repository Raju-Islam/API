import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_comments/controllers/commments_controller.dart';
import 'package:get_comments/controllers/post_controller.dart';
import 'package:get_comments/controllers/resource_controller.dart';
import 'package:get_comments/controllers/user_controller.dart';
import 'package:get_comments/views/comment/comment_page.dart';

import 'package:get_comments/views/createPost/create_post.dart';
import 'package:get_comments/views/post/post_page.dart';
import 'package:get_comments/views/resource/resource_page.dart';
import 'package:get_comments/views/user/user_page.dart';

class ApiPage extends StatelessWidget {
  const ApiPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("API"),
      ),
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: ElevatedButton(
                  onPressed: () {
                    Get.find<PostController>().getPost();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PostPage(),
                      ),
                    );
                  },
                  child: const Text("Get Post"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: ElevatedButton(
                  onPressed: () {
                    Get.find<CommentController>().getAllComment();

                    Get.to(
                      () => const CommentPage(),
                    );
                  },
                  child: const Text("Get Commmet"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: ElevatedButton(
                  onPressed: () {
                    Get.find<UserController>().getUser();
                    Get.to(
                      () => const UserPage(),
                    );
                  },
                  child: const Text("Get User"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: ElevatedButton(
                  onPressed: () {
                    Get.find<ResourceController>().getAllResource();
                    Get.to(
                      () => const ResourcePage(),
                    );
                  },
                  child: const Text("Get Resource"),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                child: ElevatedButton(
                  onPressed: () {
                    Get.to(
                      () => CreatePost(),
                    );
                  },
                  child: const Text("Create Post"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
