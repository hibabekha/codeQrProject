import 'package:code_qr_project/IU/HomeScreen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatefulWidget {
  static const id = 'welcomeScreen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 5), () {
      Navigator.pushNamed(context, HomeScreen.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            children: [
              Positioned(
                top: 0,
                left: 0,
                child: Image.asset("assets/images/homeScreenBackground1.png", width: size.width ,),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
