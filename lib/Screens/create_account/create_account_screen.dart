import 'dart:io';
import 'package:chat_app/utils/figmaUtils/design_utils.dart';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import '../reusable/loading_button.dart';
import 'create_account_getx.dart';
import 'create_account_repo.dart';

class CreateAccountPage extends GetView<CreateAccountController> {
  const CreateAccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create Account'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 10),
            FormBuilder(
              key: controller.formKeyAccount,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FormBuilderField(
                        name: 'profileImage',
                        builder: (FormFieldState<dynamic> field) {
                          return const SizedBox();
                        },
                      ),
                      Text(
                        'Name **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'name',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your name.';
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
                      SizedBox(height: 20.adaptSize),
                      Text(
                        'Email **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'email',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email.';
                          }
                          if (!GetUtils.isEmail(value)) {
                            return 'Please enter a valid email.';
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
                        keyboardType: TextInputType.emailAddress,
                      ),
                      SizedBox(height: 20.adaptSize),

                      Text(
                        'Password **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'password',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password.';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters.';
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
                      SizedBox(height: 20.adaptSize),

                      Text(
                        'Gender **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderDropdown(
                        name: 'gender',
                        items: ['Male', 'Female', 'Other']
                            .map((gender) => DropdownMenuItem(
                          value: gender,
                          child: Text(gender),
                        ))
                            .toList(),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                              vertical: 8.0, horizontal: 8),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please select your gender.';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 20.adaptSize),

                      Text(
                        'Age **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'age',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your age.';
                          }
                          if (int.tryParse(value) == null) {
                            return 'Please enter a valid number.';
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
                      SizedBox(height: 20.adaptSize),

                      Text(
                        'Address **',
                        style: context.textTheme.titleSmall,
                      ),
                      const SizedBox(height: 10),
                      FormBuilderTextField(
                        name: 'address',
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your address.';
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
                      SizedBox(height: 20.adaptSize),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Profile Image',
                            style: context.textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {
                              _showImagePickerDialog(context);
                            },
                            child: Obx(() {
                              return CircleAvatar(
                                radius: 50.0,
                                backgroundColor: Colors.grey.shade300,
                                child: picture(),
                              );
                            }),

                          ),
                          const SizedBox(height: 20),
                          Text(
                            'Tap to change image',
                            style: context.textTheme.bodySmall?.copyWith(color: Colors.blue),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            LoadingButton(
              onPressed: () async {
                await _saveForm();
              },
              child: Text(
                'Create Account',
                style: context.textTheme.titleSmall?.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget picture() {
    if (controller.fileimageFile.value == null) {
      return const CircleAvatar(
        radius: 50.0,
        backgroundImage: AssetImage('assets/images/get1.jpg'),
      );
    } else {
      return CircleAvatar(radius: 50.0, backgroundImage: FileImage(controller.fileimageFile.value!));
    }
  }

  Future<void> _showImagePickerDialog(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) => _buildImagePickerBottomSheet(context),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(50.0),
            )
        )
    );
  }

  Widget _buildImagePickerBottomSheet(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 20.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 20.0),
                Center(
                  child: Container(
                    height: 7.0,
                    width: 50.0,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                  ),
                ),
                Container(height: 30),
                ListTile(
                  title: Text(
                    'From Gallery 🖼️ ',
                    style: context.textTheme.bodyMedium!.copyWith(color: Colors.black),
                  ),
                  onTap: () async {
                    await _openGallery(context);
                    Get.back();
                  },
                ),
                ListTile(
                  title: Text(
                    'From Camera 📷 ',
                    style: context.textTheme.bodyMedium!.copyWith(color: Colors.black),
                  ),
                  onTap: () async {
                    await _openCamera(context);
                    Get.back();
                  },
                ),
                Container(height: 20)
              ]
          ),
        )
    );
  }

  Future<void> _openCamera(BuildContext context) async {
    final ImagePicker picker = ImagePicker();

    try {
      final cameraImageFile = await picker.pickImage(
          source: ImageSource.camera,
          imageQuality: 70
      );

      if (cameraImageFile != null) {
        final xfile = await d.MultipartFile.fromFile(cameraImageFile.path);
        controller.fileimageFile.value = File(cameraImageFile.path);
        controller.multiPartPhoto = xfile;
        controller.update();
      }
    } catch (e) {
      debugPrint('User canceled image capturing');
    }
  }

  Future<void> _openGallery(BuildContext context) async {
    final ImagePicker picker = ImagePicker();
    try {
      final galleryImageFile = await picker.pickImage(
          source: ImageSource.gallery,
          imageQuality: 70
      );

      if (galleryImageFile != null) {
        final xfile = await d.MultipartFile.fromFile(galleryImageFile.path);

        controller.fileimageFile.value = File(galleryImageFile.path);
        controller.multiPartPhoto = xfile;
        controller.update();
      }
    } catch (e) {
      debugPrint('User Canceled Image picking');
    }
  }

  Future<void> _saveForm() async {
    if (controller.multiPartPhoto != null) {
      Fluttertoast.showToast(msg: 'Image');
      controller.formKeyAccount.currentState!.fields['profileImage']!.didChange(controller.multiPartPhoto);
    }

    if (controller.formKeyAccount.currentState!.saveAndValidate()) {
      try {
        d.Response response = await createAccountRepository.createAccount(d.FormData.fromMap(controller.formKeyAccount.currentState!.value,),);
        if (response.statusCode == 201 || response.statusCode == 200) {
          Fluttertoast.showToast(msg: 'Account created successfully');
        } else {
          Get.snackbar(
            'Error',
            'Failed to create account',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      } catch (e) {
        Get.snackbar(
          'Error',
          'An error occurred: ${e.toString()}',
          snackPosition: SnackPosition.BOTTOM,
        );
      }
    }
  }
}