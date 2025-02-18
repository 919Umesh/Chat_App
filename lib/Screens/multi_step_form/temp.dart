import 'package:chat_app/Screens/multi_step_form/personal_info.dart';
import 'package:chat_app/Screens/multi_step_form/summary_section.dart';
import 'package:flutter/material.dart';
import 'duration.dart';
import 'education.dart';

class FourthPage extends StatelessWidget {
  static var controller = TextEditingController();
  const FourthPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Fourth Page'),
        ),
        TextFormField(
          controller: controller,
          onFieldSubmitted: (s){
            Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context)=> const FinalScreen(),
                    settings: RouteSettings(
                      arguments: {
                        'first' : FirstPage.controller.text,
                        'second' : SecondPage.controller.text,
                        'third' : ThirdPage.controller.text,
                        'fourth' : FourthPage.controller.text
                      },
                    )
                )
            );
          },
          decoration: InputDecoration(
              label: Text('Password'),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1,color: Colors.blue)
              )
          ),
        ),
      ],
    );
  }
}
