import 'dart:convert';

import 'package:kiosk/constants/api.dart';
import 'package:http/http.dart' as http;

class GetVehicleProvider {
  Future<List<String>> getVehicle() async {
    String url = ApiConstants.HOST + "/Vehicles";
    List<String> list = List();
    try {
      var response = await http.get(Uri.encodeFull(url),
          headers: {"Content-Type": "application/json"});
      if (response.statusCode == 200) {
        final listData = json.decode(response.body);
        for (var data in listData) {
          if (data['isActive'] == true) {
            String name = data['name'];
            String id = data['id'];
            list.add(id + "-" + name);
          }
        }
      }
    } catch (e) {
      print("error");
      throw Exception("Network");
    }
    return list;
  }
}
