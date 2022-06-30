import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unicons/unicons.dart';

import 'My_Account.dart';

class AccountSetting extends StatelessWidget {
  const AccountSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Account Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            buildItem(context, 'Security', Iconsax.security_user,size ,(){}),
            buildItem(context, 'Deactivate Account', Icons.error,size ,(){}),
            buildItem(context, 'Delete Account', Iconsax.profile_delete,size, (){}),
          ],
        ),
      ),
    );
  }
}
