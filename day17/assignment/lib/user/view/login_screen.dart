import 'package:assignment/common/component/custom_textfield.dart';
import 'package:assignment/common/const/style.dart';
import 'package:assignment/user/controller/login_controller.dart';
import 'package:assignment/user/controller/signup_controller.dart';
import 'package:assignment/user/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends GetView<LoginController> {
  const LoginScreen({super.key});

  static const String routeName = '/login';

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
              '환영합니다',
              textAlign: TextAlign.start,
              style: Style.textStyle.copyWith(
                fontSize: 24,
              ),
            ),
            const SizedBox(height: 16),
            CustomTextField(
              textEditingController: controller.idController,
              hintText: '이메일을 입력하세요',
            ),
            const SizedBox(height: 8),
            CustomTextField(
              textEditingController: controller.pwController,
              hintText: '비밀번호를 입력하세요',
              obscureText: true,
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.red,
                textStyle: Style.textStyle,
              ),
              onPressed: () {
                controller.login();

                controller.idController.text = '';
                controller.pwController.text = '';
              },
              child: const Text('로그인'),
            ),
            TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                textStyle: Style.textStyle,
              ),
              onPressed: () {
                Get.toNamed(SignupScreen.routeName);
                Get.put(SignupController());
              },
              child: const Text('회원가입하기'),
            ),
            const Text(
              '임시 계정\nid: abc9@gmail.com\npw: asdfasdfasdf',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
