import 'package:flutter/foundation.dart';

class ApiEndpoint {
  static const String baseUrl = kDebugMode ? 'https://node-chat-mvlu.onrender.com' : 'https://node-chat-mvlu.onrender.com';
  static const String imagebaseUrl = kDebugMode ? 'http://192.168.101.2:8080' : 'http://192.168.101.2:8080';

  static const String getCustomer= '/users/getUsers';
  static const String postUserLogin= '/users/loginUser';
  static const String createAccount= '/users/createUser/';

  //notes/subjects
  static const String getSemester= '/notes/semesters';
  static const String getSubject= '/notes/subjects/';
  static const String getNotes= '/notes/notes/';

}
