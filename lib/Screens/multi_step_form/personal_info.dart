import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {

  static var controller = TextEditingController();
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text('First Page'),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              label: Text('Name'),
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