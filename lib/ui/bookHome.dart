
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kiosk/constants/appColor.dart';
import 'package:kiosk/ui/bookSelection.dart';
import 'package:kiosk/ui/widgets/backButton.dart';

class BookHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.landscapeLeft, DeviceOrientation.landscapeRight]);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: AppColor.PRIMARY_BLUE,
        body: Column(
          children: <Widget>[
             Padding(
              padding: const EdgeInsets.all(20.0),
              child: Align(alignment: Alignment.topLeft, child: MyBackButton()),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: width / 6 + 30, vertical: height / 4 - 70),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      print('Booked');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookSelectionPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 20,
                          )
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Counter(
                            color: AppColor.TEXT_PHONE_NUMBER,
                            image: "assets/images/member.png",
                            number: 'BẠN LÀ',
                            title: 'THÀNH VIÊN               ',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  GestureDetector(
                    onTap: () async {
                      
                    },
                    child: Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 4),
                            blurRadius: 20,
                          )
                        ],
                      ),
                      child: Row(
                        children: <Widget>[
                          Counter(
                            color: AppColor.TEXT_PHONE_NUMBER,
                            number: 'BẠN CHƯA LÀ',
                            image: "assets/images/new.png",
                            title: ' THÀNH VIÊN              ',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class Counter extends StatelessWidget {
  final String number;
  final Color color;
  final String title;
  final String image;
  const Counter({Key key, this.color, this.number, this.title, this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            height: 90,
            width: 90,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
              ),
            ),
          ),
          SizedBox(height: 10),
          Text(
            number,
            style: TextStyle(fontSize: 20, color: color),
            textAlign: TextAlign.center,

          ),
          
          Text(
            title,
            style: TextStyle(color: color),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
