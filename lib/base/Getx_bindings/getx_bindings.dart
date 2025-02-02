import 'package:get/get.dart';
import '../../Screens/create_account/create_account_getx.dart';
import '../../Screens/get_customer/get_customer_getX.dart';
import '../../Screens/loginLocal/login_getX.dart';
import '../../Screens/notes/notes_getx.dart';
import '../../Screens/splash/splash_getx.dart';



class AppBindings implements Bindings {
  @override
  void dependencies() {
    //Bindings of controller
    Get.lazyPut<SplashScreenController>(() => SplashScreenController(), fenix: true);
    Get.lazyPut<GetCustomerController>(() => GetCustomerController(), fenix: true);
    Get.lazyPut<LoginLocalController>(() => LoginLocalController(), fenix: true);
    Get.lazyPut<CreateAccountController>(() => CreateAccountController(), fenix: true);
    Get.lazyPut<GetNotesController>(() => GetNotesController(), fenix: true);
  }
}
