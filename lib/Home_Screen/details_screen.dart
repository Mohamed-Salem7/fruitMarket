import 'package:flutter/material.dart';
import 'package:fruit/Home_Screen/models/Product_Model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key, required this.productModel}) : super(key: key);
  final ProductModel productModel;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Details',
        ),
        backgroundColor: Colors.lightGreen,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size.height * 0.23,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${productModel.image}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text(
              ('${productModel.name}'),
              style: const TextStyle(
                fontSize: 18,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              ('${productModel.describe}'),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            const Text(
              'Nutrition',
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.grey,
                  radius: 5.5,
                ),
                SizedBox(
                  width: size.width * 0.02,
                ),
                const Text(
                  'Protein',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 12,
                    color: Color(0xff393939),
                  ),
                  softWrap: false,
                ),
              ],
            ),
            const Spacer(),
            Row(
              children: [
                Text(
                  ('${productModel.mass}'),
                  style: const TextStyle(fontSize: 18),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: size.height * 0.05,
                    width: size.width * 0.4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.lightGreen,
                    ),
                    child: const Center(
                      child: Text(
                        'Buy Now',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
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
