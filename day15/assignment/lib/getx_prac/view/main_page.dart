import 'package:assignment/getx_prac/controller/app_global_data_controller.dart';
import 'package:assignment/getx_prac/view/user_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'memo_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(
      AppGlobalDataController(
        name: 'Teddy',
        age: 99,
        memos: ['memo1'].obs,
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text('${controller.name}, ${controller.age}'),
            Obx(() => Text('memos: ${controller.memos}'),),

            TextButton(
              onPressed: () {
                Get.to(() => MemoPage());
              },
              child: Text('To MemoPage'),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => UserPage());
              },
              child: Text('To UserPage'),
            ),
            TextButton(
              onPressed: () {
                controller.memos.add('새로운 메모가 들어갑니다');
              },
              child: Text('Add Memo'),
            ),
          ],
        ),
      ),
    );
  }
}
