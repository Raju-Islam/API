import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_comments/controllers/commments_controller.dart';

class CommentPage extends StatelessWidget {
  const CommentPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Comment"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<CommentController>(
          builder: (controller) => controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.allComments.length,
                  itemBuilder: (context, index) => ListTile(
                    leading: Text(
                      controller.allComments[index].id.toString(),
                    ),
                    title: Text(controller.allComments[index].name),
                    subtitle: Text(controller.allComments[index].email),
                  ),
                ),
        ),
      ),
    );
  }
}
