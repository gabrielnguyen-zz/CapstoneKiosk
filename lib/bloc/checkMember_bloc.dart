import 'dart:async';

import 'package:flutter/material.dart';
import 'package:kiosk/dataprovider/checkMember.dart';
import 'package:kiosk/ui/booking/member/unbooked/unbookedMemberCheckIn.dart';
import 'package:kiosk/ui/widgets/dialog.dart';

class CheckMemberBloc {
  StreamController checkMember = new StreamController();
  StreamController isLogging = new StreamController();
  Stream get isLoggingStream => isLogging.stream;
  Stream get checkMemberStream => checkMember.stream;

  Future<bool> checkMemberNum(context, String phoneNum) async {
    isLogging.sink.add("Logging");
    print("Bloc Check");
    var checkProvider = CheckMemberProvider();
    var result = await checkProvider.checkMember(phoneNum).catchError((error) {
      OpenDialog.displayDialog("Error", context, "Kiểm tra lại kết nối mạng");
      isLogging.sink.add("Done");
    });
    if (result.fullname != null && result.fullname != "empty") {
      print(result);
      Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => UnbookedMemberCheckIn(cust: result)));
          isLogging.sink.add("Done");
      return true;
    } else if (result.fullname == "empty") {
      isLogging.sink.add("Done");
      print("Số điện thoại chưa được đăng ký");
      OpenDialog.displayDialog(
          "Error", context, "Số điện thoại chưa được đăng ký");
      return false;
    } else {
      isLogging.sink.add("Done");
      return false;
    }
  }
}
