import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:dio/dio.dart' as d;

class CreateAccountController extends GetxController {
  final formKeyAccount = GlobalKey<FormBuilderState>();

  var fileimageFile = Rx<File?>(null);

  void updateImage(File image) {
    fileimageFile.value = image;
  }
  d.MultipartFile? multiPartPhoto;
}