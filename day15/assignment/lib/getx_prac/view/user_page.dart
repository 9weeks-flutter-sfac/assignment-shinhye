import 'package:assignment/getx_prac/controller/app_global_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<AppGlobalDataController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('${controller.name} / ${controller.age}'),
            Text('현재 메모 수: ${controller.memos.length}'),
          ],
        ),
      ),
    );
  }
}
