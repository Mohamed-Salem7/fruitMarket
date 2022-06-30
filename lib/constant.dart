

 import 'package:flutter/material.dart';

String uId = ' ';

 void navigatorFinished(context, widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(
   builder: (context) => widget,
  ),
      (route) {
   return false;
  },
 );
