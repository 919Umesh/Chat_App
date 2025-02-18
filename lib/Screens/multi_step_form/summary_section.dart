import 'package:flutter/material.dart';

class FinalScreen extends StatelessWidget {
  const FinalScreen({super.key});

  @override
  Widget build(BuildContext context) {

    var data = ModalRoute.of(context)?.settings.arguments as Map<String,String>;

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
            Text('first page data: ${data['first']}'),
            Text('second page data: ${data['second']}'),
            Text('third page data: ${data['third']}'),
            Text('fourth page data: ${data['fourth']}'),
          ],
        ),
      ),
    );
  }
}