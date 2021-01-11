import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiosk/ui/widgets/backButton.dart';
import 'package:flutter/services.dart';
import 'package:kiosk/constants/appColor.dart';

class BookedGetNumberScreen extends StatefulWidget {
  @override
  _BookedGetNumberScreen createState() => _BookedGetNumberScreen();
}

class _BookedGetNumberScreen extends State<BookedGetNumberScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    super.initState();
  }

  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColor.PRIMARY_BLUE,
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(alignment: Alignment.topLeft, child: MyBackButton()),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 70.0),
              child: Row(
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 90,
                    width: 90,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/phone-number.png"),
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 20),
                    width: width * 0.55,
                    child: Column(
                      children: [
                        Text(
                          "Kiểm tra thành viên dùng số điện thoại:",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 80),
              // child: MyTextField(
              //   label: 'Số điện thoại',
              //   controller: phoneController,
              //   validator: (value) {
              //     if (phoneController.text.trim().isEmpty) {
              //       return "Số điện thoại không được để trống!";
              //     }
              //     return null;
              //   },
              // ),

              child: Column(
                children: [
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 40,
                    child: CupertinoTextField(
                        placeholder: '  Số điện thoại',
                        controller: phoneController,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(blurRadius: 10, color: Colors.black38)
                            ])),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                showDialogConfirmActive();
              },
              child: Container(
                height: 60,
                child: Container(
                  width: width / 4,
                  child: Text(
                    'Kiểm tra',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColor.PRIMARY_TEXT_WHITE,
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  void showDialogConfirmActive() {
    showDialog(
        context: this.context,
        builder: (BuildContext context) {
          // return object of type Dialog
          return CupertinoAlertDialog(
            title: Text('Đang kiểm tra'),
            content: Container(
              height: 80,
              child: Center(
                child: Column(children: [
                  SizedBox(height:10),
                  CircularProgressIndicator(),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Vui lòng chờ trong giây lát",
                    style: TextStyle(color: Colors.blueAccent),
                  )
                ]),
              ),
            ),
          );
        });
  }
}

// return AlertDialog(
//   title: new Text("Processing"),
//   content: Container(
//     height: 80,
//     child: Center(
//       child: Column(children: [
//         CircularProgressIndicator(),
//         SizedBox(
//           height: 10,
//         ),
//         Text(
//           "Please Wait....",
//           style: TextStyle(color: Colors.blueAccent),
//         )
//       ]),
//     ),
//   ),
// );
