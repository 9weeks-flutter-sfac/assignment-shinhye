import 'package:assignment/offline/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InfoPage extends StatelessWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppController>();

    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            // Get.snackbar('showSnackbar', '${controller.memos}');
            print(Get.find<AppController>().memos);
            print(Get.find<AppController>().memos.length);
          },
          child: Text('asdf'),
        ),
      ),
    );
  }
}
