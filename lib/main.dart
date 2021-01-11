
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kiosk/constants/appColor.dart';
import 'package:kiosk/ui/bookHome.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check In',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: MyCheckInPage(),
    );
  }
}

class MyCheckInPage extends StatelessWidget {
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
              padding: EdgeInsets.symmetric(
                  horizontal: width / 6 + 30, vertical: height / 4 - 10),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 20),
                  GestureDetector(
                    onTap: () {
                      print('Checkin');
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => BookHomePage()));
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
                            image: "assets/images/checkin.png",
                            number: 'BẠN MUỐN',
                            title: 'CHECK IN               ',
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
                            number: 'BẠN MUỐN',
                            image: "assets/images/checklist.png",
                            title: '  XỬ LÝ ĐƠN HÀNG ',
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
