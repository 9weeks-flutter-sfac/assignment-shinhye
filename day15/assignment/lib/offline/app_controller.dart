import 'package:get/get.dart';

class AppController extends GetxController {
  RxList<String> memos = RxList<String>();

  AppController({
    required this.memos,
  });

  @override
  void onInit() {
    super.onInit();

    // ever(memos, (_) {
    //   print('변경감지: ${memos.length}');
    // });

    once(memos, (_) {
      print('변경감지: ${memos.length}');
    });

    print('[GetX] (custom) AppController created!');
  }
}
