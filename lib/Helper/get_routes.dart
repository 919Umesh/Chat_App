import 'package:get/get.dart';
import '../Screens/create_account/create_account_screen.dart';
import '../Screens/get_customer/get_customer_page.dart';
import '../Screens/loginLocal/login_screen.dart';
import '../Screens/multi_step_form/multi_step_form.dart';
import '../Screens/notes/semester_page.dart';
import '../Screens/splash/splash_page.dart';

class Routes {
  Routes._();

  static const String getCustomerPage = '/getCustomer';
  static const String getQuestionPage = '/getQuestionPage';
  static const String postLogin = '/postLogin';
  static const String createAccountPage = '/createAccountPage';
  static const String semesterPage = '/semesterPage';
  static const String splashPagePath = '/splashPagePath';
  static const String formPagePath = '/formPagePath';

  static final routes = [
    GetPage(name: getCustomerPage, page: () =>  const GetCustomerPage()),
    GetPage(name: postLogin, page: () =>  const LoginLocalPage()),
    GetPage(name: createAccountPage, page: () =>  const CreateAccountPage()),
    GetPage(name: semesterPage, page: () =>   const SemesterScreen()),
    GetPage(name: splashPagePath, page: () =>   const SplashScreenPage()),
    GetPage(name: formPagePath, page: () =>    HorizontalStepperForm()),
  ];
}
