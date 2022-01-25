import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_comments/controllers/resource_controller.dart';

class ResourcePage extends StatelessWidget {
  const ResourcePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("All Resource"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GetBuilder<ResourceController>(
          builder: (controller) => controller.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView.builder(
                  itemCount: controller.allResource.length,
                  itemBuilder: (context, index) => Card(
                    child: ListTile(
                      leading: Text(
                        controller.allResource[index].id.toString(),
                      ),
                      title: Text(controller.allResource[index].name),
                      subtitle: Text(
                        controller.allResource[index].year.toString(),
                      ),
                    ),
                  ),
                ),
        ),
      ),
    );
  }
}
