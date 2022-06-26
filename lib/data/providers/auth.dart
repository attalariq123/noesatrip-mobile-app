import 'dart:async';
import 'package:flutter/widgets.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:noesatrip_app/helpers/http_exception.dart';

class Auth with ChangeNotifier {
  String? _userName;
  String? _email;
  String? _userId;
  String? _token;

  String? get username {
    return _userName;
  }

  String? get token {
    if (_token != null) {
      return _token;
    }
    return null;
  }

  String? get email {
    return _email;
  }

  String? get userId {
    return _userId;
  }

  Future<void> logout() async {
    final url = Uri.parse('http://localhost:8000/api/logout');

    try {
      await http.post(
        url,
        headers: {"Authorization": "Bearer $_token"},
      );

      return Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> login(String? email, String? password) async {
    final url = Uri.parse('http://localhost:8000/api/login');

    try {
      final res = await http.post(
        url,
        body: json.encode({
          "email": email,
          "password": password,
        }),
      );

      final resData = json.decode(res.body);
      // print(resData);

      if (resData['message'] != null) {
        throw HttpException(resData['message']);
      }

      _token = resData['token'];
      _userId = resData['user']['id'].toString();
      _userName = resData['user']['name'];
      _email = resData['user']['email'];

      notifyListeners();
      return Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> register(String? username, String? email, String? password,
      String? confirmation) async {
    final url = Uri.parse('http://localhost:8000/api/register');

    try {
      final res = await http.post(
        url,
        body: json.encode(
          {
            "name": username,
            "email": email,
            "password": password,
            "password_confirmation": confirmation,
          },
        ),
      );

      final resData = json.decode(res.body);

      if (resData['errors'] != null) {
        throw HttpException(resData['message']);
      }

      _token = resData['token'];
      _userId = resData['user']['id'].toString();
      _userName = resData['user']['name'];
      _email = resData['user']['email'];

      notifyListeners();
      return Future.delayed(const Duration(milliseconds: 500));
    } catch (e) {
      rethrow;
    }
  }
}
