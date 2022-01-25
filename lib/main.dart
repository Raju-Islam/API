import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_comments/helper/get_di.dart' as di;
import 'package:get_comments/views/all_api/api_page.dart';

void main() async {
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: ThemeData(primarySwatch: Colors.teal),
      debugShowCheckedModeBanner: false,
      home: const ApiPage(),
    );
  }
}
