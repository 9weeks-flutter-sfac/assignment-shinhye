import 'package:assignment/assignment/controller/app_setting_controller.dart';
import 'package:assignment/assignment/controller/timer_controller.dart';
import 'package:assignment/assignment/screen/store_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(TimerController());
    var appSettingController = Get.put(
      AppSettingController(
        isSoundOn: true.obs,
        isNotification: true.obs,
        appVersion: 'v0.0.0'.obs,
        appName: 'appName'.obs,
        appAuthor: 'appAuthor'.obs,
        appPackageName: 'appPackageName'.obs,
      ),
    );

    return Scaffold(
      body: SizedBox(
        width: Get.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Current coin: ',
                  style: TextStyle(
                    fontSize: 28,
                  ),
                ),
                Obx(
                  () => Text(
                    '${controller.seconds.obs}',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Icon(
              FontAwesomeIcons.bitcoin,
              size: 96.0,
              color: Colors.yellow.shade700,
            ),
            TextButton(
              onPressed: () {
                Get.to(() => StoreScreen());
              },
              child: Text('상점으로 이동하기'),
            ),
            Divider(),
            TextButton(
              onPressed: () {
                Get.find<AppSettingController>().isSoundOn.value = !Get.find<AppSettingController>().isSoundOn.value;
              },
              child: Text('sound toggle'),
            ),
            Obx(() => Text('sound: ${appSettingController.isSoundOn.obs}')),
            TextButton(
              onPressed: () {
                Get.find<AppSettingController>().isNotification.value = !Get.find<AppSettingController>().isNotification.value;
              },
              child: Text('noti toggle'),
            ),
            Obx(() => Text('notification: ${appSettingController.isNotification.obs}')),
          ],
        ),
      ),
    );
  }
}
