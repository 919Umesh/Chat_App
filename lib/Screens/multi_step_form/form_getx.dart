import 'dart:io';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../Helper/get_routes.dart';
import 'form_repo.dart';

class FromController extends GetxController {
  final formCreate = GlobalKey<FormBuilderState>();
  final formKeyEducation = GlobalKey<FormBuilderState>();
  File? fileimageFile;
  d.MultipartFile? multiPartPhoto;

  Future<void> saveForm() async {
    if (multiPartPhoto != null) {
      formCreate.currentState?.fields['profile_pic_url']
          ?.didChange(multiPartPhoto);
    }
    
    if (formCreate.currentState?.saveAndValidate() ?? false) {
      debugPrint('---------Fields------');
      formCreate.currentState!.fields.forEach((key,field){
        debugPrint('$key:${field.value}');
      });
      debugPrint('----------File--------');
      if (fileimageFile != null) {
        debugPrint('Selected File Path: ${fileimageFile!.path}');
      }
      if (multiPartPhoto != null) {
        debugPrint('Multipart File Name: ${multiPartPhoto!.filename}');
      }
      debugPrint('----------end--------');
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

  Future<void> saveEducation() async {
    Fluttertoast.showToast(msg: 'Education');
    if (formKeyEducation.currentState?.saveAndValidate() ?? false) {
      debugPrint('--------- Education Form Fields ------');
      formKeyEducation.currentState!.fields.forEach((key, field) {
        debugPrint('$key: ${field.value}');
      });
      debugPrint('Full Education Form Data: ${formKeyEducation.currentState!.value}');
      debugPrint('---------- End --------');
      try {
        final response = await createFromRepository.createForm(
          form: d.FormData.fromMap(
            formKeyEducation.currentState!.value,
          ),
        );

        if (response.statusCode == 201 || response.statusCode == 200) {
          debugPrint('Education details saved successfully');
        } else {
          debugPrint('Failed to save education details');
        }
      } catch (e) {
        debugPrint('Error saving education details: $e');
      }
    }
  }

}