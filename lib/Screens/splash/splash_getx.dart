import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import '../../Helper/get_routes.dart';
import '../../Helper/shared_preference_fun.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    navigateToNextScreen();
  }

  void navigateToNextScreen() async {
    await Future.delayed(const Duration(seconds: 2));

    bool isLoggedIn = await SharedPreferencesHelper.getBool(key: 'isLogin');

    Fluttertoast.showToast(msg: isLoggedIn.toString());
    if (isLoggedIn) {
      Get.offAllNamed(Routes.postLogin);
    }
    else {
      Get.offAllNamed(Routes.postLogin);
    }
  }
}