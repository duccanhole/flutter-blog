import 'dart:convert';

import 'package:app/api/index.dart';
import 'package:http/http.dart' as http;

class UserApi {
  Future<http.Response> register(String userName, String password) {
    final data = jsonEncode(<String, String>{
      'userName': userName.toString(),
      'password': password.toString()
    });
    return http.post(Uri.http(rootUrl, "user/register"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: data);
  }
  Future<http.Response> login(String userName, String password) {
    final data = jsonEncode(<String, String>{
      'userName': userName.toString(),
      'password': password.toString()
    });
    return http.post(Uri.http(rootUrl, "user/login"),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: data);
  }
}
