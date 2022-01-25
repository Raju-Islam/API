import 'package:get/get.dart';
import 'package:get_comments/controllers/commments_controller.dart';
import 'package:get_comments/controllers/post_controller.dart';
import 'package:get_comments/controllers/post_create_controller.dart';
import 'package:get_comments/controllers/resource_controller.dart';
import 'package:get_comments/controllers/user_controller.dart';

Future<void> init() async {
  Get.lazyPut(() => UserController());
  Get.lazyPut(() => PostController());
  Get.lazyPut(() => CommentController());
  Get.lazyPut(() => ResourceController());
  Get.lazyPut(() => PostCreateController());
}
