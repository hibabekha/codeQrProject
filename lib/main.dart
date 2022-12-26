import 'package:flutter/material.dart';
import 'IU/homeScreen.dart';
import 'IU/scanCodeQr.dart';
import 'IU/visitorList.dart';

import 'IU/welcomeScreen.dart';

void main() {
  runApp(MyHomeApp());
}

class MyHomeApp extends StatefulWidget {
  @override
  State<MyHomeApp> createState() => _MyHomeAppState();
}

class _MyHomeAppState extends State<MyHomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Code Qr App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      initialRoute: WelcomeScreen.id,
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        ScanCodeQr.id: (context) => ScanCodeQr(),
        VisitorList.id: (context) => VisitorList(),
      },
    );
  }
}
