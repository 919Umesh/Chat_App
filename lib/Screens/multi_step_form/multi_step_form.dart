import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'first_page.dart';
import 'form_getx.dart';
import 'second_page.dart';
import 'third_page.dart';
import 'fourth_page.dart';

class HorizontalStepperForm extends StatefulWidget {
  const HorizontalStepperForm({super.key});

  @override
  State<HorizontalStepperForm> createState() => _HorizontalStepperFormState();
}

class _HorizontalStepperFormState extends State<HorizontalStepperForm> {
  var pages = [
    const FirstPage(),
    const SecondPage(),
    const ThirdPage(),
    const FourthPage(),
  ];

  int currentIndex = 0;

  Map<String, String> formData = {};

  final FromController controller = Get.put(FromController());

  void saveData(String key, String value) {
    setState(() {
      formData[key] = value;
    });
  }

  void moveToNextPage() {
    if (currentIndex < pages.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void moveToPreviousPage() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
              child: LinearProgressIndicator(
                color: Colors.blue.shade700,
                value: (currentIndex + 1) / 4,
                borderRadius: BorderRadius.circular(10),
                minHeight: 20,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: PageView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  // Disable swipe
                  itemCount: pages.length,
                  controller: PageController(initialPage: currentIndex),
                  itemBuilder: (context, index) {
                    return pages[currentIndex];
                  },
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                    onTap: currentIndex == 0 ? null : moveToPreviousPage,
                    child: Container(
                      height: 50,
                      width: 110,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Center(child: Text('Previous')),
                    )),
                GestureDetector(
                  onTap: () {
                    switch (currentIndex) {
                      case 0:
                        controller.saveForm();
                        break;
                      case 1:
                        controller.saveEducation();
                        break;
                      case 2:
                        saveData('email', ThirdPage.controller.text);
                        Fluttertoast.showToast(msg: ThirdPage.controller.text);
                        break;
                      case 3:
                        saveData('address', FourthPage.controller.text);
                        Fluttertoast.showToast(msg: FourthPage.controller.text);
                        break;
                      default:
                        Fluttertoast.showToast(msg: 'Invalid Index');
                        return;
                    }
                    moveToNextPage();
                  },
                  child: Container(
                    height: 50,
                    width: 110,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Center(child: Text('Save & Next')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
