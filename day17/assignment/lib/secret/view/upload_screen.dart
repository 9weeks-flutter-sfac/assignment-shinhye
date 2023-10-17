import 'package:assignment/common/component/custom_textfield.dart';
import 'package:assignment/common/const/style.dart';
import 'package:assignment/secret/controller/upload_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UploadScreen extends GetView<UploadController> {
  const UploadScreen({super.key});

  static const String routeName = '/upload';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          '글쓰기',
          style: Style.textStyle.copyWith(fontSize: 24),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomTextField(
              maxLines: 10,
              maxLength: 500,
              hintText: '내용을 작성하세요',
              textEditingController: controller.uploadController,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                textStyle: Style.textStyle,
              ),
              onPressed: () async {
                if (controller.uploadController.text == '') {
                  Get.snackbar(
                    '글을 작성해주세요',
                    '내용이 없습니다.',
                    backgroundColor: Colors.white,
                  );
                } else {
                  print(controller.uploadController.text);
                  controller.upload(controller.uploadController.text);
                }
              },
              child: Text('작성완료'),
            ),
          ],
        ),
      ),
    );
  }
}
