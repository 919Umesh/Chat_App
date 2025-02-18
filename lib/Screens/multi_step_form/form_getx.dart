import 'dart:io';
import 'package:dio/dio.dart' as d;
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class FromController extends GetxController {
  final formCreate = GlobalKey<FormBuilderState>();
  File? fileimageFile;
  d.MultipartFile? multiPartPhoto;

}