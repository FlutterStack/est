import 'dart:convert';
import 'package:expert_properties/Model/user_favorites.dart';
import 'package:http/http.dart' as http;
import 'package:expert_properties/utils.dart';
import 'package:expert_properties/constants.dart';

class UserFavRepository {
  Utils utils = new Utils();
  bool _isSave = false;
  Future<bool> addUserFavorites(int estateId, int userId) async {
    try {
      var body = Map<String, dynamic>();
      body['estateId'] = estateId.toString();
      body['userId'] = userId.toString();

      String url = utils.getEndPoint('api/v1/user/favorites/save');
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        if (data == status_code_success.toString()) {
          _isSave = true;
        } else {
          _isSave = false;
        }
        return _isSave;
      }
    } catch (e) {
      print('Unable to Insert the data');
      return null;
    }
  }

  Future<List<UserFav>> getUserFavorites(int userId) async {
    List<UserFav> userFav = [];
    try {
      var body = Map<String, dynamic>();
      body['userId'] = userId.toString();
      String url = utils.getEndPoint('api/v1/user/favorites/all');
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        userFav = data.map((e) => UserFav.fromJson(e)).toList();
        return userFav;
      }
    } catch (e) {
      print("Unable to load records:  $e");
      return null;
    }
  }
}
