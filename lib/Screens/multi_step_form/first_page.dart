import 'dart:io';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'custom_image_picker.dart';
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


  Widget picture() {
    if (controller.fileimageFile != null) {
      return CircleAvatar(
        radius: 50.0,
        backgroundImage: FileImage(controller.fileimageFile!),
      );
    } else {
      return const CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage('assets/images/avatar.jpeg'),
      );
    }
  }

  Future<void> _showDialog(BuildContext context, bool? userPic) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => buildBottomSheet(context, userPic),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50.0)),
      ),
    );
  }

  Widget buildBottomSheet(BuildContext context, bool? userPic) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Center(
              child: Container(
                height: 7.0,
                width: 50.0,
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ListTile(
              title: Text(
                'From Gallery 🖼️',
                style: context.textTheme.bodyMedium!.copyWith(color: Colors.black),
              ),
              onTap: () async {
                await _openGallery(context);
                Get.back();
              },
            ),
            ListTile(
              title: Text(
                'From Camera 📷',
                style: context.textTheme.bodyMedium!.copyWith(color: Colors.black),
              ),
              onTap: () async {
                await _openCamera(context);
                Get.back();
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Future<void> _openCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    try {
      final cameraImageFile =
      await picker.pickImage(source: ImageSource.camera, imageQuality: 70);
      if (cameraImageFile != null) {
        final xfile = await d.MultipartFile.fromFile(cameraImageFile.path);
        controller.fileimageFile = File(cameraImageFile.path);
        controller.multiPartPhoto = xfile;
        controller.update();
      }
    } catch (e) {
      debugPrint('User canceled image capturing');
    }
  }

  // Open gallery to pick image
  Future<void> _openGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    try {
      final galleryImageFile =
      await picker.pickImage(source: ImageSource.gallery, imageQuality: 70);
      if (galleryImageFile != null) {
        final xfile = await d.MultipartFile.fromFile(galleryImageFile.path);
        controller.fileimageFile = File(galleryImageFile.path);
        controller.multiPartPhoto = xfile;
        controller.update();
      }
    } catch (e) {
      debugPrint('User canceled image picking');
    }
  }


}