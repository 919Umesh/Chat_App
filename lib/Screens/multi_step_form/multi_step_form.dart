// import 'package:chat_app/Screens/multi_step_form/second_page.dart';
// import 'package:chat_app/Screens/multi_step_form/third_page.dart';
// import 'package:flutter/material.dart';
// import 'first_page.dart';
// import 'fourth_page.dart';
//
// class HorizontalStepperForm extends StatefulWidget {
//   const HorizontalStepperForm({super.key});
//
//   @override
//   State<HorizontalStepperForm> createState() => _HorizontalStepperFormState();
// }
//
// class _HorizontalStepperFormState extends State<HorizontalStepperForm> {
//   var pages = [
//     const FirstPage(),
//     const SecondPage(),
//     const ThirdPage(),
//     const FourthPage(),
//   ];
//
//   int currentIndex = 0;
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 30),
//               child: LinearProgressIndicator(
//                 color: Colors.blue.shade700,
//                 value: (currentIndex + 1) / 4,
//                 borderRadius: BorderRadius.circular(10),
//                 minHeight: 20,
//               ),
//             ),
//             Expanded(
//               child: Padding(
//                 padding: const EdgeInsets.all(15),
//                 child: PageView(
//                   onPageChanged: (i) {
//                     setState(() {
//                       currentIndex = i;
//                     });
//                   },
//                   padEnds: true,
//                   children: pages,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'first_page.dart';
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
                  physics: const NeverScrollableScrollPhysics(), // Disable swipe
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
                ElevatedButton(
                  onPressed: currentIndex == 0 ? null : moveToPreviousPage,
                  child: const Text('Prev'),
                ),
                ElevatedButton(
                  onPressed: () {
                    switch (currentIndex) {
                      case 0:
                        saveData('name', FirstPage.controller.text);
                        break;
                      case 1:
                        saveData('phone', SecondPage.controller.text);
                        Fluttertoast.showToast(msg: SecondPage.controller.text);
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
                  child: const Text('Save & Next'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}