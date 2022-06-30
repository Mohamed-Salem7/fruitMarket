import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:iconsax/iconsax.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text('My Orders'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: size.height * 0.16,
                  width: size.width * 0.35,
                  decoration: BoxDecoration(
                    color: Colors.lightGreen,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                Flexible(
                  fit: FlexFit.loose,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('Broccoli',style: TextStyle(fontSize: 16),),
                          Spacer(),
                          IconButton(onPressed: (){}, icon: Icon(Iconsax.arrow_circle_right))
                        ],
                      ),
                       SizedBox(
                        height: size.height * 0.001,
                      ),
                      RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        maxRating: 5,
                        itemSize: 25,
                        itemBuilder: (context, _) => Icon(Icons.star,color: Colors.amber, ),
                        onRatingUpdate: (value) {},
                      ),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Text('Rating this Product',style: TextStyle(fontWeight: FontWeight.w300,color: Colors.grey),),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      const Text('Delivered on 26 Jan 2022',style: TextStyle(color: Colors.black),),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
