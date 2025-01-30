import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:chat_app/Screens/splash/splash_getx.dart'; // Import the controller

class SplashScreenPage extends GetView<SplashScreenController> {
  const SplashScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your logo or app name here
            Icon(
              Icons.chat,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Chat App',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 20),
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}