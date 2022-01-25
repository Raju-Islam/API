import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_comments/controllers/post_controller.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  _UserPageState createState() => _UserPageState();
}

class _UserPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Post"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: GetBuilder<PostController>(
          builder: (controller) {
            return controller.isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: controller.allPost.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                          leading: Text(
                            controller.allPost[index].id.toString(),
                          ),
                          title: Text(controller.allPost[index].title),
                          subtitle: Text(controller.allPost[index].body),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
