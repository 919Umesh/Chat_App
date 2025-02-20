import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_fonts/google_fonts.dart';
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
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
            //   child: LinearProgressIndicator(
            //     color: Colors.blue.shade700,
            //     value: (currentIndex + 1) / 4,
            //     borderRadius: BorderRadius.circular(10),
            //     minHeight: 20,
            //   ),
            // ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.blue.shade700, Colors.blue.shade400],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue.shade200.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: const Offset(2, 4),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Icon(Icons.book, color: Colors.white, size: 20),
                    const SizedBox(width: 8),
                    Text(
                      'Page ${currentIndex + 1} of 4',
                        style: GoogleFonts.poppins(fontSize: 18,fontWeight: FontWeight.w600,color: Colors.white)
                    ),
                  ],
                ),
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                      onTap: currentIndex == 0 ? null : moveToPreviousPage,
                      child: Container(
                        height: 50,
                        width: 110,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child:  Center(child: Text('Previous',style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white))),
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
                          Fluttertoast.showToast(msg: ThirdPage.controller.text);
                          break;
                        case 3:
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
                      width: 120,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child:  Center(child: Text('Save & Next', style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w500,color: Colors.white))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
