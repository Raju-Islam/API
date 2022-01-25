import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_comments/controllers/user_controller.dart';

class UserPage extends StatelessWidget {
  const UserPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All User"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<UserController>(
          builder: (controller) => controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.allUser.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text(
                        controller.allUser[index].id.toString(),
                      ),
                      title: Text(controller.allUser[index].email),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
