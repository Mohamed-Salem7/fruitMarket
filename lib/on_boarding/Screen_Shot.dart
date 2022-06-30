import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit/Home_Screen/Main_Screen.dart';
import 'package:fruit/login/login_screen.dart';
import 'package:fruit/on_boarding/on_boarding.dart';

import '../constant.dart';

class ScreenShot extends StatefulWidget {
  const ScreenShot({Key? key}) : super(key: key);

  @override
  State<ScreenShot> createState() => _ScreenShotState();
}

class _ScreenShotState extends State<ScreenShot> {
  @override
  void initState() {
    super.initState();

    loadPage();
  }

  loadPage() async {
    await Future.delayed(
      const Duration(
        seconds: 2,
      ),
    );
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => OnBoarding() != null ? (uId != null ? MainScreen() : LoginScreen()): OnBoarding() ),
        ModalRoute.withName('/ScreenOne'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          const Expanded(
            child: Center(
              child: Text(
                "Fruit Market",
                style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: Colors.white
                ),
              ),
            ),
          ),
          Container(
            alignment: AlignmentDirectional.bottomCenter,
            decoration: const BoxDecoration(
            ),
            child: const Image(
              width: double.infinity,
              image: AssetImage(
                'images/launch_app.png',
              ),
              fit: BoxFit.cover,
            ),
          ),
        ],
      ),
    );
  }
}
