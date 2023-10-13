import 'dart:async';
import 'package:get/get.dart';

class TimerController extends GetxController {
  // Rx<Duration> duration = Rx<Duration>(Duration.zero);
  RxInt seconds = 0.obs;

  @override
  void onInit() {
    super.onInit();

    print('Controller created!');

    startTimer();

    ever(seconds, (callback) {
      if (seconds != 0 && seconds % 10 == 0) {
        Get.snackbar('코인 $seconds개 돌파', '축하합니다!');
      }
    });
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      seconds++;
    });
  }
}
