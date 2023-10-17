import 'package:assignment/common/const/style.dart';
import 'package:assignment/common/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class LogoutScreen extends GetView<AuthController> {
  const LogoutScreen({super.key});

  static const String routeName = '/logout';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black38,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        centerTitle: false,
        title: Text(
          'Profile',
          style: Style.textStyle.copyWith(fontSize: 24),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextButton(
            style: TextButton.styleFrom(
              foregroundColor: Colors.white,
              textStyle: Style.textStyle,
            ),
            onPressed: () {
              controller.logout();
              Get.lazyPut(() => LoginController());
            },
            child: const Text('로그아웃할까요?'),
          ),
        ],
      ),
    );
  }
}
