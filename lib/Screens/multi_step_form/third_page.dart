//
// import 'package:flutter/material.dart';
//
// class ThirdPage extends StatelessWidget {
//   static var controller = TextEditingController();
//
//   const ThirdPage({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Padding(
//           padding: EdgeInsets.all(8.0),
//           child: Text('Third Page'),
//         ),
//         TextFormField(
//           controller: controller,
//           decoration: InputDecoration(
//               label: const Text('Email'),
//               enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(8),
//                   borderSide: const BorderSide(width: 1, color: Colors.blue))),
//         ),
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';

class ThirdPage extends StatelessWidget {
  static var controller = TextEditingController();

  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text('Third Page'),
        ),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            label: const Text('Email'),
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