import 'dart:io';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

import '../../Helper/get_routes.dart';
import 'form_repo.dart';

class FromController extends GetxController {
  final formCreate = GlobalKey<FormBuilderState>();
  File? fileimageFile;
  d.MultipartFile? multiPartPhoto;

  Future<void> saveForm() async {
    if (multiPartPhoto != null) {
      formCreate.currentState?.fields['profile_pic_url']
          ?.didChange(multiPartPhoto);
    }
    if (formCreate.currentState?.saveAndValidate() ?? false) {
      try {
        final response = await createFromRepository.createForm(
          form: d.FormData.fromMap(
           formCreate.currentState!.value,
          ),
        );

        if (response.statusCode == 201 || response.statusCode == 200) {
          Get.offAndToNamed(Routes.semesterPage);
        }
      } catch (e) {
        debugPrint('Error saving form: $e');
      }
    }
  }

}