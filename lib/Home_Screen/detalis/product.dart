// import 'package:flutter/material.dart';
// import 'package:flutter_rating_bar/flutter_rating_bar.dart';
// import 'package:fruit/Home_Screen/cubit/cubit.dart';
// import 'package:fruit/Home_Screen/models/Product_Model.dart';
//
// class Product extends StatelessWidget {
//   const Product({Key? key}) : super(key: key);
//
//
//
//   @override
//   Widget build(ProductModel productModel,BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Stack(
//           alignment: AlignmentDirectional.topEnd,
//           children: [
//             Container(
//               height: 150,
//               width: 150,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(
//                   20,
//                 ),
//                 image: const DecorationImage(
//                   image: AssetImage(
//                     'images/2.png',
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: (){}
//                 ,
//                 child: CircleAvatar(
//                   backgroundColor: Colors.white,
//                   radius: 16,
//                   child: Icon(
//                     Icons.add,
//                     color: Colors.white,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//         RatingBar.builder(
//           initialRating: 3,
//           minRating: 1,
//           itemSize: 20,
//           direction: Axis.horizontal,
//           allowHalfRating: true,
//           itemCount: 5,
//           itemBuilder: (context, _) => const Icon(
//             Icons.star,
//             size: 15,
//             color: Colors.amber,
//           ),
//           onRatingUpdate: (rating) {},
//         ),
//         const Text(
//           'Strawberry',
//         ),
//         const Text(
//           '300 per/kg',
//         ),
//       ],
//     );
//   }
// }
