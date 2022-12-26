import 'package:code_qr_project/IU/scanCodeQr.dart';
import 'package:code_qr_project/IU/visitorList.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const id = 'homeScreen';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
        child: Scaffold(
          body: Container(
            height: size.height,
            width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: 0,
                  left: 0,
                  child: Image.asset(
                    "assets/images/homeScreen_Top.png",
                    width: size.width,
                  ),
                ),
                Column(
                  children: [
                    SizedBox(
                      height: 200,
                    ),
                    Center(
                      child: Text('', style: TextStyle(fontSize: 20)),
                    ),
                    SizedBox(
                      height: 80,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, ScanCodeQr.id);
                      },
                      child: Container(
                          height: 100,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.0, 20.0),
                                  blurRadius: 30.0,
                                  color: Colors.deepPurple,
                                )
                              ],
                              borderRadius: BorderRadius.circular(22.0)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 100,
                                width: 290,
                                padding: EdgeInsets.symmetric(
                                    vertical: 35.0, horizontal: 20.0),
                                child: Text("Scan Code QR",
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        ?.apply(color: Colors.white)),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.purple.shade400,
                                        Colors.blueAccent.shade400
                                      ]),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(22.0),
                                      topLeft: Radius.circular(22.0),
                                      bottomRight: Radius.circular(200.0)),
                                ),
                              ),
                              Image.asset(
                                "assets/images/scanIcon.png",
                                height: 50,
                                width: 50,
                              )
                            ],
                          )),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, VisitorList.id);
                      },
                      child: Container(
                          height: 100,
                          width: 350,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0.0, 20.0),
                                  blurRadius: 30.0,
                                  color: Colors.deepPurple,
                                )
                              ],
                              borderRadius: BorderRadius.circular(22.0)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                height: 100,
                                width: 290,
                                padding: EdgeInsets.symmetric(
                                    vertical: 35.0, horizontal: 20.0),
                                child: Text("Visitors List",
                                    style: Theme.of(context)
                                        .textTheme
                                        .button
                                        ?.apply(color: Colors.white)),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Colors.purple.shade400,
                                        Colors.blueAccent.shade400
                                      ]),
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(22.0),
                                      topLeft: Radius.circular(22.0),
                                      bottomRight: Radius.circular(200.0)),
                                ),
                              ),
                              Image.asset(
                                "assets/images/listIcon.jpg",
                                height: 50,
                                width: 50,
                              )
                            ],
                          )),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
        onWillPop: () async => false);
  }
}
