import 'package:flutter/material.dart';

class SecondPage extends StatelessWidget {
  static var controller = TextEditingController();

  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Second Page'),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
              label: const Text('Phone'),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(width: 1, color: Colors.blue))),
        ),
      ],
    );
  }
}
