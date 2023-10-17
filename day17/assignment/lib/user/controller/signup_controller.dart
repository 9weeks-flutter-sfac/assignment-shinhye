import 'package:assignment/secret/controller/secrets_controller.dart';
import 'package:assignment/secret/view/main_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/const/api_routes.dart';
import '../../common/controller/auth_controller.dart';

class SignupController extends GetxController {
  var createIdController = TextEditingController();
  var setPwController = TextEditingController();
  var setPwCheckController = TextEditingController();
  var createUsernameController = TextEditingController();
  final dio = AuthController().dio;

  createAccount() async {
    try {
      var res = await dio.post(
        ApiRoutes.signUp,
        data: {
          'email': createIdController.text,
          'password': setPwController.text,
          'passwordConfirm': setPwCheckController.text,
          'username': createUsernameController.text,
        },
      );

      print(res.data);

      if (res.statusCode == 200) {
        Get.snackbar(
          '계정을 생성하고 있습니다.',
          '잠시만 기다려주세요.',
          backgroundColor: Colors.white,
        );

        Get.offAndToNamed(MainScreen.routeName);
        createIdController.text = '';
        setPwController.text = '';
        setPwCheckController.text = '';
        createUsernameController.text = '';

        Get.find<SecretsController>().readSecrets();
      }
    } on DioException catch (e) {
      print(e);
      Get.snackbar(
        '계정 생성에 실패했습니다.',
        '에러: $e',
        backgroundColor: Colors.white,
      );
    }
  }
}
