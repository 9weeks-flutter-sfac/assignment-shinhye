import 'package:assignment/controller/login_controller.dart';
import 'package:assignment/controller/main_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({super.key});

  static const String routeName = '/login';

  @override
  Widget build(BuildContext context) {
    var main = Get.find<MainController>();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: controller.idController,
            ),
            TextField(
              controller: controller.pwController,
              obscureText: true,
            ),
            ElevatedButton(
              onPressed: (){
                controller.login();

                controller.idController.text = '';
                controller.pwController.text = '';

              },
              child: Text('로그인'),
            ),
          ],
        ),
      ),
    );
  }
}
