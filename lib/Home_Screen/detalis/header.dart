import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({Key? key, required this.title, required this.text, required this.offer}) : super(key: key);


  final String title;
  final String text;
  final String offer;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment:
          CrossAxisAlignment.start,
          children:  [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: size.height * 0.005,
            ),
            Text(
              text,
              style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w300,
                  color: Colors.black),
            ),
          ],
        ),
         Text(
          offer,
          style: const TextStyle(
            color: Colors.green,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
