import 'package:assignment/getx_prac/controller/app_global_data_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MemoPage extends StatelessWidget {
  const MemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: (){
        Get.put(AppGlobalDataController(name: 'Teddy', age: 99, memos: ['asdf', 'asdf'].obs));
      }),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: Get.find<AppGlobalDataController>().memos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text('${Get.find<AppGlobalDataController>().memos}'),
            );
          },
        ),
      ),
    );
  }
}
