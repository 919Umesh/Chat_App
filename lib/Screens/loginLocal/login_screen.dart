import 'package:chat_app/Helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart' hide FormData, Response;
import 'package:icons_plus/icons_plus.dart';
import '../../Helper/get_routes.dart';
import '../../Helper/shared_preference_fun.dart';
import 'login_getX.dart';
import 'login_repository.dart';

class LoginLocalPage extends GetView<LoginLocalController> {
  const LoginLocalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              AppColors.primary,
              AppColors.primary,
            ],
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildHeader(),
                    const SizedBox(width: 20),
                    _buildIllustration(),
                  ],
                ),
                const SizedBox(height: 20),
                _buildLoginForm(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Padding(
      padding: EdgeInsets.only(left: 20),
      child: Text(
        'Login',
        style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontFamily: 'inter'),
      ),
    );
  }

  Widget _buildIllustration() {
    return Center(
      child: Icon(Bootstrap.person,size: 145,)
    );
  }
  // Widget _buildIllustration() {
  //   return Center(
  //     child: Image.asset(
  //       'assets/images/login.png',
  //       height: 150,
  //       width: 120,
  //     ),
  //   );
  // }

  Widget _buildLoginForm(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    return Container(
      width: double.infinity,
      height: deviceHeight / 1.4,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            spreadRadius: 5,
          ),
        ],
      ),
      padding: const EdgeInsets.all(30),
      child: FormBuilder(
        key: controller.formKeyLogin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEmailField(),
            const SizedBox(height: 20),
            _buildPasswordField(),
            const SizedBox(height: 15),
            _buildForgotPassword(),
            const SizedBox(height: 20),
            _buildLoginButton(context),
            const SizedBox(height: 20),
            _buildSocialLogin(),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Email:',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              fontFamily: 'inter'),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: FormBuilderTextField(
            name: 'email',
            decoration: InputDecoration(
              hintText: 'example@email.com',
              hintStyle:
                  TextStyle(color: Colors.grey[400], fontFamily: 'inter'),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            validator: (value) => value == null || value.isEmpty
                ? 'Please enter a valid email.'
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Password:',
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
              fontFamily: 'inter'),
        ),
        const SizedBox(height: 8),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: FormBuilderTextField(
            name: 'password',
            obscureText: true,
            decoration: InputDecoration(
              hintText: '******',
              hintStyle:
                  TextStyle(color: Colors.grey[400], fontFamily: 'inter'),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide.none,
              ),
              contentPadding:
                  const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            ),
            validator: (value) => value == null || value.isEmpty
                ? 'Please enter your password.'
                : null,
          ),
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: InkWell(
        onTap: () {
          Fluttertoast.showToast(msg: 'Forget Password?');
        },
        child: const Text(
          'Forgot Password ?',
          style: TextStyle(
              fontSize: 14, color: AppColors.primary, fontFamily: 'inter'),
        ),
      ),
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    double deviceWidth = MediaQuery.of(context).size.width;
    return Center(
      child: SizedBox(
        width: deviceWidth / 1.8,
        height: 50,
        child: ElevatedButton(
          onPressed: _saveForm,
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.primary,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
          child: const Text(
            'Login',
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'inter'),
          ),
        ),
      ),
    );
  }

  Widget _buildSocialLogin() {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'OR',
                style: TextStyle(color: Colors.grey),
              ),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _socialButton(Bootstrap.facebook, () {}),
            _socialButton(Bootstrap.google, () {}),
            _socialButton(Bootstrap.twitter_x, () {}),
          ],
        ),
      ],
    );
  }

  Widget _socialButton(IconData icon, VoidCallback onPressed) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Icon(
          icon,
          size: 30, // Adjust the size of the icon
        ),
      ),
    );
  }

  Future<void> _saveForm() async {
    try {
      if (controller.formKeyLogin.currentState!.saveAndValidate()) {
        final formData = {
          'email': controller.formKeyLogin.currentState!.value['email'],
          'password': controller.formKeyLogin.currentState!.value['password'],
        };
        final response = await loginLocalRepository.userLogin(formData);
        if (response.statusCode == 200) {
          await SharedPreferencesHelper.saveBool(key: 'isLogin', value: true);
          _showSuccessMessage(response.statusMessage.toString());
          _resetForm();
          controller.update();
          Get.offAllNamed(Routes.semesterPage);
        } else {
          _showErrorMessage(response.statusMessage.toString());
        }
      }
    } catch (e) {
      _showErrorMessage(e.toString());
    }
  }

  void _resetForm() {
    controller.formKeyLogin.currentState?.reset();
  }

  void _showSuccessMessage(String message) {
    Get.snackbar(
      "Success",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }

  void _showErrorMessage(String message) {
    Get.snackbar(
      "Error",
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      duration: const Duration(seconds: 3),
    );
  }
}
