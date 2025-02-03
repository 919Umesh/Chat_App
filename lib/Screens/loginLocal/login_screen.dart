// import 'package:chat_app/utils/figmaUtils/design_utils.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_form_builder/flutter_form_builder.dart';
// import 'package:get/get.dart' hide FormData, Response;
// import 'package:icons_plus/icons_plus.dart';
// import '../../Helper/constants.dart';
// import '../../Helper/get_routes.dart';
// import '../../Helper/shared_preference_fun.dart';
// import '../reusable/icon_button_b.dart';
// import 'login_getX.dart';
// import 'login_repository.dart';
//
// class LoginLocalPage extends GetView<LoginLocalController> {
//   const LoginLocalPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [
//               AppColors.backgroundColor.withOpacity(0.9),
//               AppColors.backgroundColor,
//             ],
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 24.0),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   const SizedBox(height: 40),
//                   _buildHeader(),
//                   const SizedBox(height: 40),
//                   _buildCustomerForm(context),
//                   SizedBox(height: 30.adaptSize),
//                   _buildSaveButton(),
//                   const SizedBox(height: 20),
//                   _buildForgotPassword(),
//                   const SizedBox(height: 40),
//                   _buildSocialLogin(),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildHeader() {
//     return const Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Welcome Back!',
//           style: TextStyle(
//             fontSize: 32,
//             fontWeight: FontWeight.bold,
//             color: Colors.blue,
//           ),
//         ),
//         SizedBox(height: 8),
//         Text(
//           'Sign in to continue',
//           style: TextStyle(
//             fontSize: 16,
//             fontFamily: 'roboto',
//             color: Colors.blue,
//           ),
//         ),
//       ],
//     );
//   }
//
//   FormBuilder _buildCustomerForm(BuildContext context) {
//     return FormBuilder(
//       key: controller.formKeyLogin,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           _buildTextField(
//             context,
//             label: 'Email',
//             name: 'email',
//             hintText: 'Enter your email',
//             prefixIcon: Icons.email_outlined,
//             validator: (value) =>
//             value == null || value.isEmpty ? 'Please enter a valid email.' : null,
//           ),
//           SizedBox(height: 20.adaptSize),
//           _buildTextField(
//             context,
//             label: 'Password',
//             name: 'password',
//             hintText: 'Enter your password',
//             prefixIcon: Icons.lock_outline,
//             isPassword: true,
//             validator: (value) =>
//             value == null || value.isEmpty ? 'Please enter your password.' : null,
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTextField(
//       BuildContext context, {
//         required String label,
//         required String name,
//         required String hintText,
//         required String? Function(String?)? validator,
//         IconData? prefixIcon,
//         bool isPassword = false,
//       }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: const TextStyle(
//             fontSize: 16,
//             fontWeight: FontWeight.w600,
//             color: Colors.blue,
//           ),
//         ),
//         const SizedBox(height: 8),
//         FormBuilderTextField(
//           name: name,
//           obscureText: isPassword,
//           autovalidateMode: AutovalidateMode.onUserInteraction,
//           validator: validator,
//           style: const TextStyle(color: Colors.blue),
//           decoration: InputDecoration(
//             hintText: hintText,
//             hintStyle: const TextStyle(color: Colors.blue),
//             prefixIcon: Icon(prefixIcon, color: Colors.blue),
//             contentPadding: const EdgeInsets.symmetric(
//               vertical: 16.0,
//               horizontal: 16,
//             ),
//             border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12.0),
//               borderSide: const BorderSide(color: Colors.blue),
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12.0),
//               borderSide: const BorderSide(color: Colors.blue),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(12.0),
//               borderSide: const BorderSide(color: Colors.blue),
//             ),
//             filled: true,
//             fillColor: Colors.white.withOpacity(0.1),
//           ),
//           keyboardType: isPassword ? TextInputType.visiblePassword : TextInputType.emailAddress,
//         ),
//       ],
//     );
//   }
//
//   Widget _buildSaveButton() {
//     return Container(
//       width: double.maxFinite,
//       height: 55.adaptSize,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(12),
//         gradient: LinearGradient(
//           colors: [Colors.blue.shade400, Colors.blue.shade600],
//         ),
//       ),
//       child: CustomIconButtonB(
//         onPressed: _saveForm,
//         text: 'Sign In',
//       ),
//     );
//   }
//
//   Widget _buildForgotPassword() {
//     return Center(
//       child: TextButton(
//         onPressed: () {
//           // Add forgot password functionality
//         },
//         child: const Text(
//           'Forgot Password?',
//           style: TextStyle(
//             color: Colors.white,
//             fontSize: 14,
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSocialLogin() {
//     return Column(
//       children: [
//         const Row(
//           children: [
//             Expanded(child: Divider(color: Colors.blue)),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16),
//               child: Text(
//                 'Continue with',
//                 style: TextStyle(color: Colors.blue),
//               ),
//             ),
//             Expanded(child: Divider(color: Colors.blue)),
//           ],
//         ),
//         const SizedBox(height: 20),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             _socialButton(Bootstrap.google, 'Google'),
//             const SizedBox(width: 20),
//             _socialButton(Bootstrap.facebook, 'Facebook'),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _socialButton(IconData icon, String platform) {
//     return Container(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
//       decoration: BoxDecoration(
//         border: Border.all(color: Colors.blue),
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Row(
//         children: [
//           Icon(icon, color: Colors.blue),
//           const SizedBox(width: 8),
//           Text(
//             platform,
//             style: const TextStyle(color: Colors.blue),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Future<void> _saveForm() async {
//     try {
//       if (controller.formKeyLogin.currentState!.saveAndValidate()) {
//         final formData = {
//           'email': controller.formKeyLogin.currentState!.value['email'],
//           'password': controller.formKeyLogin.currentState!.value['password'],
//         };
//         final response = await loginLocalRepository.userLogin(formData);
//         if (response.statusCode == 200) {
//           await SharedPreferencesHelper.saveBool(key: 'isLogin', value: true);
//           _showSuccessMessage(response.statusMessage.toString());
//           _resetForm();
//           controller.update();
//           Get.offAllNamed(Routes.semesterPage);
//         } else {
//           _showErrorMessage(response.statusMessage.toString());
//         }
//       }
//     } catch (e) {
//       _showErrorMessage(e.toString());
//     }
//   }
//
//   void _resetForm() {
//     controller.formKeyLogin.currentState?.reset();
//   }
//
//   void _showSuccessMessage(String message) {
//     Get.snackbar(
//       "Success",
//       message,
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.green,
//       colorText: Colors.blue,
//       duration: const Duration(seconds: 3),
//     );
//   }
//
//   void _showErrorMessage(String message) {
//     Get.snackbar(
//       "Error",
//       message,
//       snackPosition: SnackPosition.BOTTOM,
//       backgroundColor: Colors.red,
//       colorText: Colors.white,
//       duration: const Duration(seconds: 3),
//     );
//   }
// }

import 'package:chat_app/Helper/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart' hide FormData, Response;
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
                _buildHeader(),
                const SizedBox(height: 20),
                _buildIllustration(),
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
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildIllustration() {
    return Center(
      child: Image.asset(
        'assets/images/get1.jpg',
        height: 200,
      ),
    );
  }

  Widget _buildLoginForm(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 20),
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
      padding: const EdgeInsets.all(20),
      child: FormBuilder(
        key: controller.formKeyLogin,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildEmailField(),
            const SizedBox(height: 20),
            _buildPasswordField(),
            const SizedBox(height: 10),
            _buildForgotPassword(),
            const SizedBox(height: 20),
            _buildLoginButton(),
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
          ),
        ),
        const SizedBox(height: 8),
        FormBuilderTextField(
          name: 'email',
          decoration: InputDecoration(
            hintText: 'example@email.com',
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
          validator: (value) =>
          value == null || value.isEmpty ? 'Please enter a valid email.' : null,
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
          ),
        ),
        const SizedBox(height: 8),
        FormBuilderTextField(
          name: 'password',
          obscureText: true,
          decoration: InputDecoration(
            hintText: '******',
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.grey[100],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          ),
          validator: (value) =>
          value == null || value.isEmpty ? 'Please enter your password.' : null,
        ),
      ],
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // Add forgot password functionality
        },
        child: const Text(
          'Forgot Password ?',
          style: TextStyle(
            color: AppColors.primary,
            fontSize: 14,
          ),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return SizedBox(
      width: double.infinity,
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
            _socialButton('assets/images/get2.jpg', () {}),
            _socialButton('assets/images/get3.jpg', () {}),
            _socialButton('assets/images/get4.jpg', () {}),
          ],
        ),
      ],
    );
  }

  Widget _socialButton(String iconPath, VoidCallback onPressed) {
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
        child: Image.asset(
          iconPath,
          height: 30,
          width: 30,
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