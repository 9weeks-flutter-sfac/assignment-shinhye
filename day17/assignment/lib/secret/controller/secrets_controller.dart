import 'package:assignment/secret/model/secret_model.dart';
import 'package:get/get.dart';
import '../../common/const/api_routes.dart';
import '../../common/controller/auth_controller.dart';

class SecretsController extends GetxController {
  Rxn<List<Secret>> secrets = Rxn();

  logout() {
    Get.find<AuthController>().logout();
  }

  readSecrets() async {
    final dio = AuthController().dio;

    try {
      var res = await dio.get(
        ApiRoutes.readSecrets,
      );

      var items = List<Map<String, dynamic>>.from(res.data['items']);
      var parsedItems = items.map((e) => Secret.fromMap(e)).toList();
      secrets(parsedItems);
    } catch (e) {
      print(e);
    }
  }

  @override
  void onInit() {
    super.onInit();

    if (Get.find<AuthController>().getToken != null) {
      readSecrets();
    }
  }
}
