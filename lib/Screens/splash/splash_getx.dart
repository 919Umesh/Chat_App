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
    //To check whether the use is logged in or not
    bool isLoggedIn = await SharedPreferencesHelper.getBool(key: 'isLogin');
    if (isLoggedIn) {
      Get.offAllNamed(Routes.semesterPage);
    }
    else {
      Get.toNamed(Routes.postLogin);
    }
  }
}