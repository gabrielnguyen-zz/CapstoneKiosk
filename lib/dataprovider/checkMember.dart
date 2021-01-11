import 'dart:convert';

import 'package:kiosk/constants/api.dart';
import 'package:http/http.dart' as http;
import 'package:kiosk/models/customer.dart';

class CheckMemberProvider {
  Future<Customer> checkMember(String phoneNum) async {
    String url = ApiConstants.HOST + "/Customers/CheckAccount";
    String transactionBody = json.encode({'username': phoneNum});
    try {
      var response = await http.post(Uri.encodeFull(url),
          headers: {"Content-Type": "application/json"}, body: transactionBody);
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        var account = data['account'];
        var accId = account['accId'];
        var username = account['username'];
        var info = data['info'];
        var fullname = info['fullname'];
        var phoneNum = info['phoneNum'];
        var photo = info['photo'];
        var updDate = info['updDate'];
        var cust = data['customer'];
        var point = cust['point'].toString();
        var balance = cust['balance'].toString();
        Customer customer = new Customer(
          accId: accId,
          username: username,
          fullname: fullname,
          phoneNum: phoneNum,
          photo: photo,
          updDate: updDate,
          point: point,
          balance: balance,
        );
        print("fullname " + fullname);
        return customer;
      }
    } catch (e) {
      print("error");
      throw Exception("Network");
    }
    return Customer(fullname: "empty");
  }
}
