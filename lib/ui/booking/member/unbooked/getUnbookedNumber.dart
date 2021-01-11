import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiosk/bloc/checkMember_bloc.dart';
import 'package:kiosk/ui/widgets/backButton.dart';
import 'package:flutter/services.dart';
import 'package:kiosk/constants/appColor.dart';

class GetUnbookedNumberScreen extends StatefulWidget {
  @override
  _GetUnbookedNumberScreen createState() => _GetUnbookedNumberScreen();
}

class _GetUnbookedNumberScreen extends State<GetUnbookedNumberScreen> {
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    super.initState();
  }

  CheckMemberBloc bloc = CheckMemberBloc();
  TextEditingController phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColor.PRIMARY_BLUE,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(20.0),
                child:
                    Align(alignment: Alignment.topLeft, child: MyBackButton()),
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
                      width: width * 0.7,
                      child: Column(
                        children: [
                          Text(
                            "Để có thể hoàn thành thủ tục checkin, vui lòng nhập số điện thoại của bạn bên dưới để tiến hành kiểm tra thành viên :",
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
                          placeholder: 'Số điện thoại',
                          controller: phoneController,
                          padding: EdgeInsets.only(left: 20),
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
              StreamBuilder<Object>(
                  stream: bloc.isLoggingStream,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      if (snapshot.data == 'Logging') {
                        return Container(
                          height: 60,
                          child: Container(
                            width: width / 4,
                            child: CircularProgressIndicator(
                              valueColor: new AlwaysStoppedAnimation<Color>(
                                  AppColor.PRIMARY_BLUE),
                            ),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: AppColor.PRIMARY_TEXT_WHITE,
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                        );
                      } else {
                        return GestureDetector(
                          onTap: () {
                            onSignInClicked(context);
                          },
                          child: Container(
                            height: 60,
                            child: Container(
                              width: width / 4,
                              child: Text(
                                'Kiểm tra',
                                style: TextStyle(
                                    color: AppColor.PRIMARY_BLUE,
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
                        );
                      }                     
                    } else {
                      return GestureDetector(
                        onTap: () {
                          onSignInClicked(context);
                        },
                        child: Container(
                          height: 60,
                          child: Container(
                            width: width / 4,
                            child: Text(
                              'Kiểm tra',
                              style: TextStyle(
                                  color: AppColor.PRIMARY_BLUE,
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
                      );
                    }
                  })
            ],
          ),
        ));
  }

  bool onSignInClicked(BuildContext context) {
    FocusScope.of(context).unfocus();
    String phoneNum = phoneController.text;
    bloc.checkMemberNum(context, phoneNum);
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
                  SizedBox(height: 10),
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
