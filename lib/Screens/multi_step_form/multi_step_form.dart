import 'package:flutter/material.dart';
import 'custom_button.dart';
import 'custom_input.dart';

class FormPage extends StatefulWidget {
  const FormPage({Key? key}) : super(key: key);

  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Stepper Widget ",
          ),
          centerTitle: true,
        ),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: ListView(
            children: [
              const CustomInput(
                hint: "First Name",
                inputBorder: OutlineInputBorder(),
              ),
              const CustomInput(
                hint: "Last Name",
                inputBorder: OutlineInputBorder(),
              ),
              const CustomInput(
                hint: "Address",
                inputBorder: OutlineInputBorder(),
              ),
              const CustomInput(
                hint: "City and State",
                inputBorder: OutlineInputBorder(),
              ),
              const CustomInput(
                hint: "Bio",
                inputBorder: OutlineInputBorder(),
              ),
              const CustomInput(
                hint: "Bio",
                inputBorder: OutlineInputBorder(),
              ),
              CustomBtn(
                title: const Text(
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
                callback: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}