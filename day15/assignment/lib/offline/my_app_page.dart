import 'package:assignment/offline/info_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app_controller.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AppController(memos: [''].obs));

    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        controller.memos.add('memo');
      }),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Obx(() => Text('${controller.memos.length}')),
            TextButton(
              onPressed: () {
                // Get.to(() => InfoPage());
              },
              child: Text('MyApp Page'),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            Get.snackbar('title', 'msg');
            print(Get.width);
            print(Get.height);
            // Get.back();
          },
          child: Text('Page2 - showSnackBar'),
        ),
      ),
    );
  }
}
