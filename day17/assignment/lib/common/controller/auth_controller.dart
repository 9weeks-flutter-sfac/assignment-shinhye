import 'package:assignment/secret/view/main_screen.dart';
import 'package:assignment/user/view/login_screen.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../user/model/user_model.dart';
import '../const/api_routes.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  final dio = Dio();
  final RxnString _token = RxnString();

  User? get getUser => _user.value;

  String? get getToken => _token.value;

  login(String id, String pw) async {
    try {
      Get.snackbar(
        '사용자를 찾는 중',
        '잠시만 기다려주세요.',
        backgroundColor: Colors.white,
      );

      var res = await dio.post(
        ApiRoutes.authWithPassword,
        data: {
          'identity': id, // abc2@gmail.com
          'password': pw, // asdfasdfasdf
        },
      );

      if (res.statusCode == 200) {
        var user = User.fromMap(res.data['record']);
        _user(user);
        _token(res.data['token']);

        print(_user.value);
        print(_token);
      }
    } on DioException catch (e) {
      print(e);
      Get.snackbar(
        '계정을 확인하세요',
        '이메일 또는 비밀번호가 일치하지 않습니다.',
        backgroundColor: Colors.white,
      );
    }
  }

  logout() {
    _user.value = null;
  }

  _handleAuthChanged(User? data) async {
    await Future.delayed(const Duration(seconds: 2));

    if (data != null) {
      Get.offAndToNamed(MainScreen.routeName);
      return;
    }
    Get.offAndToNamed(LoginScreen.routeName);
    return;
  }

  @override
  void onInit() {
    super.onInit();

    _handleAuthChanged(_user.value);

    ever(_user, _handleAuthChanged);
  }
}
