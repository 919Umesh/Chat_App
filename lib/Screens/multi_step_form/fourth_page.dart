import 'package:flutter/material.dart';

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
          decoration: InputDecoration(
            label: const Text('Address'),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(width: 1, color: Colors.blue),
            ),
          ),
        ),
      ],
    );
  }
}