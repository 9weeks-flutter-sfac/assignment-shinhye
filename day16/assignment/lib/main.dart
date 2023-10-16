import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/controller/login_controller.dart';
import 'package:assignment/controller/main_controller.dart';
import 'package:assignment/view/login_page.dart';
import 'package:assignment/view/main_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => MainController());
      }),
      getPages: [
        GetPage(name: LoginPage.routeName, page: () => const LoginPage()),
        GetPage(name: MainPage.routeName, page: () => const MainPage()),
      ],
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () => Get.toNamed(LoginPage.routeName),
            child: const Text('Hello World'),
          ),
        ),
      ),
    ),
  );
}
