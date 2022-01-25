import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_comments/controllers/post_create_controller.dart';
import 'package:get_comments/models/response/create_post_response.dart';

class CreatePost extends StatelessWidget {
  CreatePost({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController jobTitleController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          createAlertDialog(context);
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GetBuilder<PostCreateController>(
            builder: (controller) => controller.allPost.isEmpty
                ? const Center(
                    child: Text("No post available"),
                  )
                : ListView.builder(
                    itemCount: controller.allPost.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(14.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: 30.0,
                                    child: Text(
                                      "ID :${controller.allPost[index].id.toString()}",
                                      style: const TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Text(
                                    "Name :${controller.allPost[index].name}",
                                    style: const TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      controller.delete(index);
                                      Get.snackbar(
                                        "Delete",
                                        "Delete post successfuly",
                                        duration: const Duration(seconds: 2),
                                      );
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      updateAlertDialog(context);
                                    },
                                    icon: const Icon(Icons.edit),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10.0,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(6.0),
                                child: Row(
                                  children: [
                                    Text(
                                      "JOB :${controller.allPost[index].jobTitle}",
                                      style: const TextStyle(fontSize: 16),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Flexible(
                                      child: Text(
                                        "createdAt : ${controller.allPost[index].createdAt}",
                                        style: const TextStyle(
                                          fontSize: 10.0,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
        ),
      ),
    );
  }

  // show create post dialog
  createAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Create Job"),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: nameController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter name";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: jobTitleController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter  job title";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Job Title',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor))),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          bool success =
                              await Get.find<PostCreateController>().postCreate(
                            PostResponse(
                              name: nameController.text,
                              jobTitle: jobTitleController.text,
                            ),
                          );
                          if (success) {
                            Navigator.pop(context);
                            Get.snackbar(
                              "Post",
                              "Post created successfuly",
                              duration: const Duration(seconds: 2),
                            );
                            nameController.clear();
                            jobTitleController.clear();
                          }
                        }
                      },
                      child: const Text("Create Post"),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  // show update post dialog
  updateAlertDialog(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Update Job"),
        actions: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                      controller: nameController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter name";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: 'Name',
                        border: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Theme.of(context).primaryColor),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      controller: jobTitleController,
                      validator: (val) {
                        if (val == null || val.isEmpty) {
                          return "Please enter  job title";
                        }
                      },
                      decoration: InputDecoration(
                          hintText: 'Job Title',
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Theme.of(context).primaryColor))),
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (formKey.currentState!.validate()) {
                          bool success = await Get.find<PostCreateController>()
                              .postCreate(PostResponse(
                            name: nameController.text.toString(),
                            jobTitle: jobTitleController.text.toString(),
                          ));
                          if (success) {
                            Navigator.pop(context);
                            Get.snackbar(
                              "Post",
                              "Post update successfuly",
                              duration: const Duration(seconds: 2),
                            );
                            nameController.clear();
                            jobTitleController.clear();
                          }
                        }
                      },
                      child: const Text("Update Post"),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
