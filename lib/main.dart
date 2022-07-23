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



  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await CacheHelper.init();

  uId = CacheHelper.getData(key: 'uId');

  runApp(MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key,}) : super(key: key);

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


