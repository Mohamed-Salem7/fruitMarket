import 'package:easy_onboarding/easy_onboarding.dart';
import 'package:flutter/material.dart';
import 'package:fruit/constant.dart';
import 'package:fruit/login/login_screen.dart';
import 'package:get/get.dart';



class OnBoarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return EasyOnboarding(
      onStart: ()
      {
        navigatorFinished(context,LoginScreen());
      },
      skipButtonColor: Colors.transparent,
      backButtonColor: Colors.lightGreen,
      nextButtonColor: Colors.lightGreen,
      backgroundColor: Colors.white,
      indicatorSelectedColor: Colors.lightGreen,
      indicatorUnselectedColor: Colors.grey,
      startButtonColor: Colors.lightGreen,
      nextButtonIcon: const Icon(
        Icons.arrow_forward,
        color: Colors.white,
      ),
      skipButtonText: const Text(
        'SKIP',
        style: TextStyle(fontSize: 15.0, color: Colors.grey),
      ),
      startButtonText: const Text(
        'GETTING STARTED',
        style: TextStyle(
          color: Colors.white,
          fontSize: 15.0,
        ),
      ),
      backButtonIcon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(image: AssetImage('images/111.png'),),
              Text(
                'E Shopping',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "Explore  top organic fruits & grab them",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(image: AssetImage('images/2.png'),),
              Text(
                'Delivery on the way',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "Get your order by speed delivery",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Image(image: AssetImage('images/3.png'),),
              Text(
                'Delivery Arrived',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              Text(
                "Order is arrived at your Place",
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.grey,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}