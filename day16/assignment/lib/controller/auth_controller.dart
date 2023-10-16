import 'package:assignment/util/api_routes.dart';
import 'package:assignment/view/login_page.dart';
import 'package:assignment/view/main_page.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import '../model/user.dart';

class AuthController extends GetxController {
  final Rxn<User> _user = Rxn();
  final dio = Dio();
  final RxnString _token = RxnString();

  User? get getUser => _user.value;

  String? get getToken => _token.value;

  login(String id, String pw) async {
    print('login try!');

    try {
      print('data input: id $id / pw: $pw');

      var res = await dio.post(
        'http://52.79.115.43:8090${ApiRoutes.authWithPassword}',
        data: {
          'identity': id, // Teddy
          'password': pw, // sfac12341234
        },
      );

      if (res.statusCode == 200) {
        var user = User.fromMap(res.data['record']);
        _user(user);
        _token(res.data['token']);
      }
    } on DioException catch (e) {
      print(e);
    }
  }

  logout() {
    _user.value = null;
  }

  _handleAuthChanged(User? data) {
    print('curData: $data');

    if (data != null) {
      Get.toNamed(MainPage.routeName);
      return;
    }
    Get.offAndToNamed(LoginPage.routeName);
    return;
  }

  @override
  void onInit() {
    super.onInit();
    ever(_user, _handleAuthChanged);
  }
}
