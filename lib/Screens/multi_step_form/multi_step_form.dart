import 'package:chat_app/Screens/multi_step_form/temp.dart';
import 'package:flutter/material.dart';
import 'duration.dart';
import 'education.dart';
import 'personal_info.dart';

class HorizontalStepperForm extends StatefulWidget {
  const HorizontalStepperForm({super.key});

  @override
  State<HorizontalStepperForm> createState() => _HorizontalStepperFormState();
}

class _HorizontalStepperFormState extends State<HorizontalStepperForm> {
  var pages =  [ const FirstPage(),const SecondPage(), const ThirdPage(),const FourthPage(),];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print('called');
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
              child: LinearProgressIndicator(
                color: Colors.blue.shade700,
                value: (currentIndex+1) /4,
                borderRadius: BorderRadius.circular(10),
                minHeight: 20,
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: PageView(
                  children: pages,
                  onPageChanged: (i){
                    setState(() {
                      currentIndex = i;
                    });
                  },
                  padEnds: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}