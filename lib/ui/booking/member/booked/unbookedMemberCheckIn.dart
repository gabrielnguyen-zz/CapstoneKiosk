import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiosk/ui/widgets/backButton.dart';
import 'package:flutter/services.dart';
import 'package:kiosk/constants/appColor.dart';

class BookedMemberCheckIn extends StatefulWidget {
  @override
  _BookedMemberCheckIn createState() => _BookedMemberCheckIn();
}

class _BookedMemberCheckIn extends State<BookedMemberCheckIn> {
  String dropDownVehicleType;
  List<String> list = ["Xe 2 bánh", "Xe 4 chỗ", "Xe 6 chỗ"];
  bool value = false;
  @override
  void initState() {
    // TODO: implement initState
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);

    super.initState();
  }

  TextEditingController plateController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: AppColor.PRIMARY_BLUE,
        body: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Align(
                        alignment: Alignment.topLeft, child: MyBackButton()),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            "Chọn Loại Xe : ",
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          child: DropdownButton<String>(
                              iconDisabledColor: Colors.white,
                              dropdownColor: Colors.white,
                              underline: SizedBox(),
                              value: dropDownVehicleType != null
                                  ? dropDownVehicleType
                                  : null,
                              items: list.map((e) {
                                return DropdownMenuItem(
                                  value: e,
                                  child: Row(children: <Widget>[
                                    Text(
                                      e.toString(),
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 20),
                                    )
                                  ]),
                                );
                              }).toList(),
                              onChanged: (String newValue) {
                                setState(() {
                                  dropDownVehicleType = newValue;
                                });
                              }),
                        ),
                        SizedBox(width: 30),
                        Text("Biển số xe : ",
                            style:
                                TextStyle(color: Colors.white, fontSize: 20)),
                        SizedBox(width: 10),
                        Container(
                          height: 45,
                          width: 250,
                          child: CupertinoTextField(
                              placeholder: '',
                              controller: plateController,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 95),
                    child: Text("Họ và tên       : ",
                        style: TextStyle(color: Colors.white, fontSize: 20)),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 45,
                    width: 200,
                    child: CupertinoTextField(
                        placeholder: '',
                        controller: nameController,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white)),
                  ),
                  SizedBox(width: 27),
                  Text("SĐT : ",
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                  SizedBox(width: 10),
                  Container(
                    height: 45,
                    width: 250,
                    child: CupertinoTextField(
                        keyboardType: TextInputType.number,
                        placeholder: '',
                        controller: phoneController,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white)),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 95),
                child: Text("Dịch vụ: ",
                    style: TextStyle(color: Colors.white, fontSize: 20)),
              ),
              Wrap(
                direction: Axis.horizontal,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top:10,left:30),
                    child: Container(
                      width: 150,
                      child: Row(
                        children: <Widget>[
                          Text(
                            'Rửa xe',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                            maxLines: 2,
                            textAlign: TextAlign.center,
                          ),
                          Theme(
                            data: ThemeData(unselectedWidgetColor: Colors.white),
                            child: Checkbox(
                              value: value,
                              onChanged: (val) {
                                setState(() {
                                  value = val;
                                  print("Rua xe " + value.toString());
                                });
                              },
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    showDialogConfirmActive();
                  },
                  child: Container(
                    height: 60,
                    child: Container(
                      width: width / 4,
                      child: Text(
                        'Check in',
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
                ),
              )
            ],
          ),
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
