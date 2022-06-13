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

  Future<void> register(String? username, String? email, String? password,
      String? confirmation) async {
    final url = Uri.parse('http://localhost:8000/api/register');

    try {
      final res = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Cache-Control": "no-cache",
        },
        body: json.encode(
          {
            "name": username,
            "email": email,
            "password": password,
            "password_confirmation": confirmation,
          },
        ),
      );
      // print(res.statusCode);
      // print(res.body);

      if (res.statusCode != 201) {
        throw HttpException("The given data was invalid");
      }

      final resData = json.decode(res.body);
      // if (resData['errors'] != null) {
      //   throw HttpException(resData['message']);
      // }

      _token = resData['token'];
      _userId = resData['user']['id'].toString();
      _userName = resData['user']['name'];
      _email = resData['user']['email'];

      // print("$_userId, $_token");

      notifyListeners();
      return;
    } catch (e) {
      rethrow;
    }
  }
}
