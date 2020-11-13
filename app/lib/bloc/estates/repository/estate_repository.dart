import 'dart:convert';
import 'package:expert_properties/Model/estate.dart';
import 'package:http/http.dart' as http;
import 'package:expert_properties/constants.dart';
import 'package:expert_properties/utils.dart';

class EstateRepository {
  Utils utils = new Utils();
  Future<List<EstateInfo>> getEstatesByPropertyId(int propertyId) async {
    List<EstateInfo> _lEstate;
    try {
      var body = Map<String, dynamic>();
      body["propertyId"] = propertyId.toString();

      String url = utils.getEndPoint('api/v1/estates');
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        _lEstate = data.map((e) => EstateInfo.fromJson(e)).toList();
        return _lEstate;
      } else {
        return null;
      }
    } catch (e) {
      print("Unable to get all estates");
    }
  }

  Future<List> getEstateDetails(int estateId) async {
    List estateDetails = [];
    try {
      var body = Map<String, dynamic>();
      body["estateId"] = estateId.toString();
      String url = utils.getEndPoint('api/v1/estate/info');
      var response = await http.post(url, body: body);
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        estateDetails = data.map((e) => e).toList();
        return estateDetails;
      }
    } catch (e) {
      print("Unable to fetch estate information");
    }
  }
}
