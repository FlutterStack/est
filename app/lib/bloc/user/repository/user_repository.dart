import 'dart:convert';
import 'dart:async';
import 'package:expert_properties/Model/user.dart';
import 'package:expert_properties/constants.dart';
import 'package:http/http.dart' as http;
import 'package:expert_properties/utils.dart';

class UserRepository {
  Utils utils = new Utils();
  Future<User> getUser(String email, String password) async {
    try {
      var body = Map<String, dynamic>();
      body['email'] = email;
      body['password'] = password;

      String url = utils.getEndPoint('api/v1/user/auth');
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var user = new User.fromJson(data);
        return user;
      }
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<bool> registerUser(Map<String, dynamic> info) async {
    try {
      var body = Map<String, dynamic>();
      body["firstname"] = info["firstname"];
      body["lastname"] = info["lastname"];
      body["email"] = info["email"];
      body["mobile"] = info["mobile"];
      body["password"] = info["password"];

      String url = utils.getEndPoint('api/v1/user/register');
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data == status_code_success.toString()) {
          return true;
        } else {
          return false;
        }
      }
    } catch (e) {
      print("Unable to register user");
    }
  }
}
