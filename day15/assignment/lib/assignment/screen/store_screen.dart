import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/timer_controller.dart';

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TimerController());

    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '상점',
              style: TextStyle(
                fontSize: 28,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '현재 보유한 코인 : ',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Obx(
                  () => Text(
                    '${controller.seconds.obs}',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ],
            ),
            TextButton(
              onPressed: () {
                controller.seconds.value = 0;
              },
              child: Text('코인 리셋'),
            ),
          ],
        ),
      ),
    );
  }
}
