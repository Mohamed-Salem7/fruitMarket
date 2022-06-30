import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruit/Home_Screen/cubit/cubit.dart';
import 'package:fruit/Home_Screen/cubit/state.dart';
import 'package:fruit/constant.dart';
import 'package:icon/icon.dart';
import 'package:iconsax/iconsax.dart';
import 'package:unicons/unicons.dart';

import 'models/Product_Model.dart';

class Favourite extends StatelessWidget {
  const Favourite({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getVegetables(),
      child: BlocConsumer<HomeCubit, HomeState>(
          listener: (context, state) {},
          builder: (context, state) {
            Size size = MediaQuery.of(context).size;
            return Scaffold(
              backgroundColor: Colors.white,
              body: Column(
                children: [
                  Container(
                    height: size.height * 0.14,
                    width: double.infinity,
                    color: Colors.lightGreen,
                    child: Stack(
                      children: const [
                        Positioned(
                          top: 85,
                          left: 20,
                          child: Text(
                            'Favourites',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  BuildCondition(
                    condition: HomeCubit.get(context).favoritesProduct != null,
                    builder:(context) => ListView.separated(
                      itemBuilder: (context, index) => buildProductFavorite(
                          HomeCubit.get(context).favoritesProduct[index],
                          context),
                      shrinkWrap: true,
                      separatorBuilder: (context, index) => buildDivider(),
                      itemCount: HomeCubit.get(context).favoritesProduct.length,
                    ),
                    fallback: (context) =>
                    const Center(child: CircularProgressIndicator()),
                  ),
                ],
              ),
            );
          }),
    );
  }
}

Widget buildProductFavorite(ProductModel productModel, BuildContext context) {
  HomeCubit homeCubit = HomeCubit.get(context);
  return Padding(
    padding: const EdgeInsets.all(20.0),
    child: SizedBox(
      height: 150,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 140,
            width: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                20,
              ),
              image: DecorationImage(
                image: NetworkImage(productModel.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 7.0,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Text(
                      '${productModel.name}',
                      style: const TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Spacer(),
                    Text(
                      '${productModel.mass}',
                      style: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Pick up from organic farms',
                  style: TextStyle(fontWeight: FontWeight.w300, fontSize: 11),
                ),
                RatingBar.builder(
                    initialRating: productModel.rating,
                    minRating: 1,
                    maxRating: 5,
                    itemCount: 5,
                    itemSize: 20,
                    allowHalfRating: true,
                    itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          size: 15,
                          color: Colors.amber,
                        ),
                    onRatingUpdate: (value) {}),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        homeCubit.decreaseNumber();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightGreen),
                        child: const Center(
                          child: Icon(
                            Iconsax.minus,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '${homeCubit.number}',
                      style: TextStyle(fontSize: 18),
                    ),
                    InkWell(
                      onTap: () {
                        homeCubit.increaseNumber();
                      },
                      child: Container(
                        height: 30,
                        width: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.lightGreen),
                        child: const Center(
                          child: Icon(
                            UniconsLine.plus,
                            size: 20,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        height: 30,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.amber,
                        ),
                        child: const Center(
                          child: Text('Add'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}

Widget buildDivider() => Container(
      height: 1,
      width: double.infinity,
      color: Colors.grey[300],
    );
