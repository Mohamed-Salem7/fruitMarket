import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unicons/unicons.dart';

import 'My_Account.dart';

class NotificationSettings extends StatelessWidget {
  const NotificationSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: const Text('Notification Settings'),
      ),
      body: Column(
        children: [
          buildItems(context, 'My Account', 'You will receive daily updates',
              true, (value) {},size),
          buildItems(context, 'Pramotional Notifications',
              'You will receive daily updates', false, (value) {},size),
        ],
      ),
    );
  }
}

Widget buildItems(BuildContext context, String title, String description,
        bool values, Function(bool value) function,Size size) =>
    Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Row(
            children: [
              const Icon(
                Icons.notifications,
                color: Colors.lightGreen,
                size: 35,
              ),
               SizedBox(
                width: size.width * 0.01,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w300),
                  ),
                   SizedBox(
                    height: size.height * 0.005,
                  ),
                  Text(
                    description,
                    style: const TextStyle(fontWeight: FontWeight.w200),
                  ),
                ],
              ),
              Spacer(),
              Switch(
                  value: values,
                  onChanged: function,
                  activeColor: Colors.lightGreen),
            ],
          ),
        ],
      ),
    );
