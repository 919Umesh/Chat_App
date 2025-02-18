
import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  static var controller = TextEditingController();
  const ThirdPage({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('ThirdPage '),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              label: Text('phone'),
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