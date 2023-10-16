import 'package:assignment/controller/auth_controller.dart';
import 'package:assignment/model/document.dart';
import 'package:assignment/util/api_routes.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var pageController = PageController();
  RxInt curPage = 0.obs;
  Rxn<List<Document>> documents = Rxn();

  onPageTapped(int v) {
    curPage(v);
    pageController.jumpToPage(v);
  }

  logout() {
    Get.find<AuthController>().logout();
  }

  readDocuments() async {
    final dio = AuthController().dio;

    try {
      var res = await dio.get(
        ApiRoutes.readDocuments,
        options: Options(
          headers: {
            'Authorization': '${Get.find<AuthController>().getToken}',
          },
        ),
      );

      var items = List<Map<String, dynamic>>.from(res.data['items']);
      var parsedItems = items.map((e) => Document.fromMap(e)).toList();
      documents(parsedItems);
    } catch (e) {
      print(e);
    }
  }
}
