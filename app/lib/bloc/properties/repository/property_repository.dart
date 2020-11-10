import 'dart:convert';
import 'package:expert_properties/Model/properties.dart';
import 'package:http/http.dart' as http;
import 'package:expert_properties/utils.dart';

class PropertyRepo {
  Utils utils = new Utils();
  Future<List<Property>> loadProperties() async {
    List<Property> properties;
    try {
      String url = utils.getEndPoint("api/v1/properties");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body) as List;
        properties = data.map((e) => Property.fromJson(e)).toList();

        return properties;
      }
    } catch (e) {
      print("Unable to load properties:  $e");
    }
  }
}
