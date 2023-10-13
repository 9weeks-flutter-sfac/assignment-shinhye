import 'package:assignment/assignment/screen/home_screen.dart';
import 'package:assignment/getx_prac/view/main_page.dart';
import 'package:assignment/offline/app_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'offline/my_app_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      home: HomeScreen(),
      // home: MainPage(),
    ),
  );
}
