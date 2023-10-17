import 'package:assignment/common/controller/auth_controller.dart';
import 'package:assignment/common/view/splash_screen.dart';
import 'package:assignment/secret/controller/secrets_controller.dart';
import 'package:assignment/secret/controller/upload_controller.dart';
import 'package:assignment/secret/view/main_screen.dart';
import 'package:assignment/secret/view/upload_screen.dart';
import 'package:assignment/user/controller/login_controller.dart';
import 'package:assignment/user/controller/signup_controller.dart';
import 'package:assignment/user/view/login_screen.dart';
import 'package:assignment/user/view/logout_screen.dart';
import 'package:assignment/user/view/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: BindingsBuilder(() {
        Get.put(AuthController());
        Get.lazyPut(() => LoginController());
        Get.lazyPut(() => SecretsController());
        Get.lazyPut(() => UploadController());
        Get.lazyPut(() => SignupController());
      }),
      getPages: [
        GetPage(name: LoginScreen.routeName, page: () => LoginScreen()),
        GetPage(name: SignupScreen.routeName, page: () => SignupScreen()),
        GetPage(name: MainScreen.routeName, page: () => MainScreen()),
        GetPage(name: LogoutScreen.routeName, page: () => LogoutScreen()),
        GetPage(name: UploadScreen.routeName, page: () => UploadScreen()),
      ],
      home: SplashScreen(),
    ),
  );
}
