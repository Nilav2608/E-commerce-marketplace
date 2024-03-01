import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:fluxestore/repository/UserRepo/user_repository.interface.dart';

import '../../network/Api/api.dart';

class USerRepository extends Api implements IUserRepository {
  @override
  Future<Map<String, dynamic>> getUserDetails(String userId) async {
    try {
      print("Repo invoked");
      print(userId);

      var response = await http.post(Uri.parse(userUrl),
          headers: {"content-type": "application/json"},
          body: jsonEncode({"userId": userId}));
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
      return {"status": false, "message": "An Internal error accurd"};
    }
  }
}
