import 'package:assignment/common/const/style.dart';
import 'package:assignment/common/controller/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends GetView<AuthController> {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(
              Icons.local_fire_department_sharp,
              color: Colors.white,
              size: 96,
            ),
            const SizedBox(height: 16),
            Text(
              '불라인드',
              textAlign: TextAlign.center,
              style: Style.textStyle.copyWith(
                fontSize: 32,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              '사용자 정보를 확인하는 중 ...',
              textAlign: TextAlign.center,
              style: Style.textStyle,
            ),
            const SizedBox(height: 8),
            const CircularProgressIndicator(
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
