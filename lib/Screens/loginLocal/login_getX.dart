import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';

import '../../Helper/shared_preference_fun.dart';

class LoginLocalController extends GetxController {
  final formKeyLogin = GlobalKey<FormBuilderState>();
  var isFingerprintLogin = false.obs;
  late final LocalAuthentication myAuthentication;
  late bool checkLogin = false;

  var authState = false.obs;

  @override
  void onInit() {
    super.onInit();
    myAuthentication = LocalAuthentication();
    myAuthentication.isDeviceSupported().then((bool isSupported) {
      authState.value = isSupported;
    });
    _checkLoginState();
  }

  Future<void> _checkLoginState() async {
    checkLogin = await SharedPreferencesHelper.getBool(key: 'isLogin');
  }

  Future<bool> authenticateWithFingerprint() async {
    try {
      bool isAuthenticated = await myAuthentication.authenticate(
        localizedReason: "Authenticate to log in",
        options: const AuthenticationOptions(
          stickyAuth: true,
          biometricOnly: true,
        ),
      );
      return isAuthenticated;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }
}
