import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fruit/Home_Screen/Main_Screen.dart';
import 'package:fruit/Home_Screen/home_screen.dart';
import 'package:fruit/cache.dart';
import 'package:fruit/constant.dart';
import 'package:fruit/login/login_screen.dart';
import 'package:fruit/on_boarding/Screen_Shot.dart';
import 'package:fruit/on_boarding/on_boarding.dart';
import 'package:get/get.dart';

void main() async {

  Widget widget;


  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');

  if(OnBoarding() != null)
  {
    if(uId != null)
    {
       widget = const MainScreen();
    }else
      {
        widget = LoginScreen();
      }
  }else
    {
      widget = OnBoarding();
    }

  runApp(MyApp(startWidget: widget,));

}

class MyApp extends StatelessWidget {
  final Widget startWidget;
  const MyApp({Key? key, required this.startWidget}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScreenShot(),
    );
  }
}


