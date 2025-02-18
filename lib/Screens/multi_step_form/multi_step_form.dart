import 'package:chat_app/Screens/multi_step_form/second_page.dart';
import 'package:chat_app/Screens/multi_step_form/third_page.dart';
import 'package:flutter/material.dart';
import 'first_page.dart';
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
                child: PageView(
                  onPageChanged: (i) {
                    setState(() {
                      currentIndex = i;
                    });
                  },
                  padEnds: true,
                  children: pages,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}