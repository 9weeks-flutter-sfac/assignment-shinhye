import 'package:assignment/common/component/custom_textfield.dart';
import 'package:assignment/common/const/style.dart';
import 'package:assignment/common/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends GetView<AuthController> {
  const SignupScreen({super.key});

  static const String routeName = '/signup';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              '불라인드의 회원으로 모십니다',
              textAlign: TextAlign.start,
              style: Style.textStyle.copyWith(
                fontSize: 24,
              ),
            ),
            SizedBox(height: 16),
            CustomTextField(
              // textEditingController: controller.idController,
              hintText: '이메일을 입력하세요',
            ),
            SizedBox(height: 8),
            CustomTextField(
              // textEditingController: controller.idController,
              hintText: '비밀번호를 입력하세요',
              obscureText: true,
            ),
            SizedBox(height: 8),
            CustomTextField(
              // textEditingController: controller.idController,
              hintText: '비밀번호를 한번 더 입력하세요',
              obscureText: true,
            ),
            SizedBox(height: 8),
            CustomTextField(
              // textEditingController: controller.idController,
              hintText: '사용할 이름을 입력하세요 (변경할 수 있습니다)',
              obscureText: true,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                textStyle: Style.textStyle,
              ),
              onPressed: () {
                // controller.login();
                //
                // controller.idController.text = '';
                // controller.pwController.text = '';
                // controller.login('id', 'pw');
              },
              child: Text('인증메일을 전송합니다'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: Style.textStyle,
              ),
              onPressed: () {
                Get.back();
              },
              child: Text('로그인하러 가기'),
            ),
          ],
        ),
      ),
    );
  }
}
