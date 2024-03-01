import 'dart:convert';

import 'package:fluxestore/network/Exceptions/exception_handlers.dart';
import 'package:http/http.dart' as http;
import 'package:fluxestore/network/Api/api.dart';
import 'package:fluxestore/repository/AuthRepo/auth_repository.interface.dart';

class AuthRepository extends Api implements IAuthRepository {
  @override
  Future<Map<String, dynamic>> login(String email, String password) async {
    try {
      var credentials = {"email": email, "password": password};

      var response = await http.post(Uri.parse(loginUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode(credentials));
      var results = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return results;
      } else if (response.statusCode == 401) {
        return results;
      } else if (response.statusCode == 400) {
        return results;
      } else {
        return results;
      }
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }

  @override
  Future<Map<String, dynamic>> register(
      String userName, String email, String password) async {
    try {
      var details = {
        "userName": userName,
        "email": email,
        "password": password
      };
      var response = await http.post(Uri.parse(registerUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode(details));
      var results = jsonDecode(response.body);
      if (response.statusCode == 201) {
        return results;
      } else if (response.statusCode == 400) {
        return results;
      } else {
        return results;
      }
    } catch (e) {
      return ExceptionHandlers().getExceptionString(e);
    }
  }
}
