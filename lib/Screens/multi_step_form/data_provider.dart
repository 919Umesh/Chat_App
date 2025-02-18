import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FormDataProvider extends ChangeNotifier {
  Map<String, dynamic> _formData = {};

  Future<void> savePageData(String page, Map<String, dynamic> data) async {
    Fluttertoast.showToast(msg: "Post");
    _formData.addAll(data);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('form_data', json.encode(_formData));
    notifyListeners();
  }

  Future<Map<String, dynamic>> getFormData() async {
    final prefs = await SharedPreferences.getInstance();
    final String? storedData = prefs.getString('form_data');
    if (storedData != null) {
      _formData = json.decode(storedData);
    }
    return _formData;
  }

  Future<void> clearFormData() async {
    _formData.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('form_data');
    notifyListeners();
  }
}