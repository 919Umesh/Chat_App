
import 'package:flutter/material.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var data = ModalRoute.of(context)?.settings.arguments as Map<String, String>;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Final Screen'),
        centerTitle: true,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('First Page Data: ${data['first']}'),
            Text('Second Page Data: ${data['second']}'),
            Text('Third Page Data: ${data['third']}'),
            Text('Fourth Page Data: ${data['fourth']}'),
          ],
        ),
      ),
    );
  }
}