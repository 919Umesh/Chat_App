import 'package:chat_app/Screens/multi_step_form/custom_image_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'form_getx.dart';

class FirstPage extends GetView<FromController> {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile Setup'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            FormBuilder(
              key: controller.formCreate,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomImagePicker(
                    currentImage: controller.fileimageFile,
                    defaultImageAsset: 'assets/images/avatar.jpeg',
                    onImageSelected: (file, multipartFile) {
                      controller.fileimageFile = file;
                      controller.multiPartPhoto = multipartFile;
                      controller.update();
                    },
                    // Optional customization
                    radius: 50.0,
                    bottomSheetIndicatorColor: Colors.green,
                    tileTextColor: Colors.black,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Full name **',
                    style: context.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    name: 'full_name',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a valid full name.';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'Contact Number (Optional)',
                    style: context.textTheme.titleSmall,
                  ),
                  const SizedBox(height: 10),
                  FormBuilderTextField(
                    name: 'contact_number',
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if (value != null && value.isNotEmpty) {
                        if (!RegExp(r'^\d{8,10}$').hasMatch(value)) {
                          return 'Please enter a valid number between 8 and 10 digits.';
                        }
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 8),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(6.0),
                      ),
                    ),
                    keyboardType: TextInputType.number,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}