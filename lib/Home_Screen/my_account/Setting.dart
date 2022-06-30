import 'package:flutter/material.dart';
import 'package:fruit/Home_Screen/my_account/Account_Setting.dart';
import 'package:fruit/Home_Screen/my_account/Change_Address.dart';
import 'package:fruit/Home_Screen/my_account/Language_Setting.dart';
import 'package:fruit/Home_Screen/my_account/Notification.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unicons/unicons.dart';

import 'My_Account.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildItem(context, 'Account', Icons.person_pin,size ,()
            {
              Get.to(const AccountSetting());
            }),
            buildItem(context, 'Notification', Icons.notifications, size,()
            {
              Get.to(const NotificationSettings());
            }),
            buildItem(context, 'Language', Icons.language,size ,()
            {
              Get.to(const LanguageSetting());
            }),
            buildItem(context, 'Change Address', Icons.edit_location,size,()
            {
              Get.to(const ChangeAddress());
            }),
          ],
        ),
      ),
    );
  }
}
