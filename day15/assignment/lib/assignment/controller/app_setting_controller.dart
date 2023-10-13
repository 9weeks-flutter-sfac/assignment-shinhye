import 'package:get/get.dart';

class AppSettingController extends GetxController {
  RxBool isSoundOn;
  RxBool isNotification;
  RxString appVersion;
  RxString appName;
  RxString appAuthor;
  RxString appPackageName;
  Rxn<DateTime> lastUpdated = Rxn();

  AppSettingController({
    required this.isSoundOn,
    required this.isNotification,
    required this.appVersion,
    required this.appName,
    required this.appAuthor,
    required this.appPackageName,
  });

  @override
  String toString() {
    return 'AppSettingController{isSoundOn: $isSoundOn, isNotification: $isNotification, appVersion: $appVersion, appName: $appName, appAuthor: $appAuthor, appPackageName: $appPackageName, lastUpdated: $lastUpdated}';
  }
}
