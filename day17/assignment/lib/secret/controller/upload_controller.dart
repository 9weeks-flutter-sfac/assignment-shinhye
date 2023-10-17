import 'package:assignment/secret/controller/secrets_controller.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../common/const/api_routes.dart';
import '../../common/controller/auth_controller.dart';

class UploadController extends GetxController {
  var uploadController = TextEditingController();
  final dio = AuthController().dio;

  upload(String secret) async {
    try {
      var res = await dio.post(
        ApiRoutes.uploadSecret,
        data: {
          'secret': secret,
          'author': Get.find<AuthController>().getUser?.id,
          'authorName': Get.find<AuthController>().getUser?.username,
        },
      );

      print(res.data);

      Get.back();

      if (res.statusCode == 200) {
        Get.find<SecretsController>().readSecrets();
      }
    } on DioException catch (e) {
      print(e);
      Get.snackbar(
        '전송에 실패했습니다.',
        '다음에 다시 시도해주세요.',
        backgroundColor: Colors.white,
      );
    }
  }
}
