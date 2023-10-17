import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/controller/auth_controller.dart';

class LoginController extends GetxController {
  var idController = TextEditingController();
  var pwController = TextEditingController();

  login() {
    Get.find<AuthController>().login(idController.text, pwController.text);
  }
}
