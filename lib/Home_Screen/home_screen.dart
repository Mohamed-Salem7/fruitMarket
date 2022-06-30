import 'package:buildcondition/buildcondition.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:fruit/Home_Screen/Notificatoin_App.dart';
import 'package:fruit/Home_Screen/cubit/cubit.dart';
import 'package:fruit/Home_Screen/cubit/state.dart';
import 'package:fruit/Home_Screen/detalis/header.dart';
import 'package:fruit/Home_Screen/models/Product_Model.dart';
import 'package:fruit/constant.dart';
import 'package:get/get.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()
        ..getVegetables()
        ..getMixedVegetables()
        ..getAlliumVegetabels()
        ..getFruits()
        ..getMixedFruits()
        ..getStoneFruit()
        ..getDryFruits()
        ..getMixedDryFruits()
        ..getDehiscentDryFruits(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          Size size = MediaQuery.of(context).size;
          HomeCubit homeCubit = HomeCubit.get(context);
          return BuildCondition(
            condition: (homeCubit.vegetables != null &&
                homeCubit.mixedVegetables != null &&
                homeCubit.alliumVegetabels != null &&
                homeCubit.fruit != null &&
                homeCubit.mixedFruits != null &&
                homeCubit.stoneFruit != null &&
                homeCubit.dryFruit != null &&
                homeCubit.mixedDryFruits != null &&
                homeCubit.dehiscentDryFruits != null),
            builder: (context) => Scaffold(
              body: Column(
                children: [
                  Container(
                    height: size.height * 0.215,
                    child: Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Align(
                          alignment: AlignmentDirectional.topStart,
                          child: Container(
                            height: size.height * 0.18,
                            color: Colors.lightGreen,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10.0),
                              child: Row(
                                children: [
                                  const Text(
                                    'Fruit Market',
                                    style: TextStyle(
                                      fontSize: 28,
                                      color: Colors.white,
                                    ),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: ()
                                    {
                                      Get.to(const NotificationApp());
                                    },
                                    icon: const Icon(
                                      Icons.notifications,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Container(
                            decoration: BoxDecoration(
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset.fromDirection(1.5, 10),
                                    spreadRadius: 0,
                                    blurRadius: 10.0),
                              ],
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(
                                  Icons.search_outlined,
                                  color: Colors.black12,
                                ),
                                border: InputBorder.none,
                                hintText: 'Search',
                                hintStyle: TextStyle(color: Colors.black12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    fit: FlexFit.loose,
                    child: Container(
                      color: Colors.grey[250],
                      child: DefaultTabController(
                        length: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              ButtonsTabBar(
                                backgroundColor: Colors.orange,
                                unselectedBackgroundColor: Colors.white30,
                                labelStyle: const TextStyle(
                                  color: Colors.white,
                                  letterSpacing: 0,
                                  fontWeight: FontWeight.bold,
                                ),
                                unselectedLabelStyle: const TextStyle(
                                  color: Colors.grey,
                                ),
                                // borderWidth: 100,
                                borderColor: Colors.orange,
                                elevation: 0.0,
                                unselectedBorderColor: Colors.white,
                                radius: 100,
                                buttonMargin: EdgeInsets.all(10),
                                duration: 1,
                                contentPadding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                tabs: const [
                                  Tab(
                                    text: 'Vegetables',
                                  ),
                                  Tab(
                                    text: 'Fruits',
                                  ),
                                  Tab(
                                    text: 'Dry Fruits',
                                  ),
                                ],
                              ),
                              Expanded(
                                child: TabBarView(
                                  physics: const BouncingScrollPhysics(),
                                  children: [
                                    SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Header(
                                            title: 'Organic Vegetables',
                                            text: 'Pick up from Organic farms',
                                            offer: '(20% Off)',
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Container(
                                            height: size.height * 0.25,
                                            child: ListView.separated(
                                              itemBuilder: (context, index) =>
                                                  buildProduct(
                                                      HomeCubit.get(context)
                                                          .vegetables[index],
                                                      context,
                                                      index,size),
                                              separatorBuilder:
                                                  (context, index) => SizedBox(
                                                width: size.width * 0.02,
                                              ),
                                              scrollDirection: Axis.horizontal,
                                              //shrinkWrap: true,
                                              itemCount: HomeCubit.get(context)
                                                  .vegetables
                                                  .length,
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          const Header(
                                            title: 'Mixed Vegetables Pack',
                                            text: 'Vegetable mix fresh pack',
                                            offer: '(10% Off)',
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Container(
                                            height: size.height * 0.25,
                                            child: ListView.separated(
                                              itemBuilder: (context, index) =>
                                                  buildProduct(
                                                      HomeCubit.get(context)
                                                              .mixedVegetables[
                                                          index],
                                                      context,
                                                      index,size),
                                              separatorBuilder:
                                                  (context, index) =>
                                                       SizedBox(
                                                        width: size.width * 0.02,
                                              ),
                                              scrollDirection: Axis.horizontal,
                                              //shrinkWrap: true,
                                              itemCount: HomeCubit.get(context)
                                                  .mixedVegetables
                                                  .length,
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          const Header(
                                            title: 'Allium Vegetables Pack',
                                            text: 'Fresh Allium Vegetables',
                                            offer: '(20% Off)',
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Container(
                                            height: size.height * 0.25,
                                            child: ListView.separated(
                                              itemBuilder: (context, index) =>
                                                  buildProduct(
                                                      HomeCubit.get(context)
                                                              .alliumVegetabels[
                                                          index],
                                                      context,
                                                      index,size),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      SizedBox(
                                                        width: size.width * 0.02,
                                                      ),
                                              scrollDirection: Axis.horizontal,
                                              //shrinkWrap: true,
                                              itemCount: HomeCubit.get(context)
                                                  .alliumVegetabels
                                                  .length,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Header(
                                            title: 'Organic Fruits',
                                            text: 'Pick up from organic farms',
                                            offer: '(20% Off)',
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Container(
                                            height: size.height * 0.25,
                                            child: ListView.separated(
                                              itemBuilder: (context, index) =>
                                                  buildProduct(
                                                      HomeCubit.get(context)
                                                          .fruit[index],
                                                      context,
                                                      index,size),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      SizedBox(
                                                        width: size.width * 0.02,
                                                      ),
                                              scrollDirection: Axis.horizontal,
                                              //shrinkWrap: true,
                                              itemCount: HomeCubit.get(context)
                                                  .fruit
                                                  .length,
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          const Header(
                                            title: 'Mixed Fruit Pack',
                                            text: 'Fruit mix fresh pack',
                                            offer: '(10% Off)',
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Container(
                                            height: size.height * 0.25,
                                            child: ListView.separated(
                                              itemBuilder: (context, index) =>
                                                  buildProduct(
                                                      HomeCubit.get(context)
                                                          .mixedFruits[index],
                                                      context,
                                                      index,size),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      SizedBox(
                                                        width: size.width * 0.02,
                                                      ),
                                              scrollDirection: Axis.horizontal,
                                              //shrinkWrap: true,
                                              itemCount: HomeCubit.get(context)
                                                  .mixedFruits
                                                  .length,
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          const Header(
                                            title: 'Stone Fruits',
                                            text: 'Fresh Stone Fruits',
                                            offer: '(20% Off)',
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Container(
                                            height: size.height * 0.25,
                                            child: ListView.separated(
                                              itemBuilder: (context, index) =>
                                                  buildProduct(
                                                      HomeCubit.get(context)
                                                          .stoneFruit[index],
                                                      context,
                                                      index,size),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      SizedBox(
                                                        width: size.width * 0.02,
                                                      ),
                                              scrollDirection: Axis.horizontal,
                                              //shrinkWrap: true,
                                              itemCount: HomeCubit.get(context)
                                                  .stoneFruit
                                                  .length,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SingleChildScrollView(
                                      physics: const BouncingScrollPhysics(),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Header(
                                            title: 'Indehiscent Dry Fruits',
                                            text: 'Pick up from organic farms',
                                            offer: '(20% Off)',
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Container(
                                            height: size.height * 0.25,
                                            child: ListView.separated(
                                              itemBuilder: (context, index) =>
                                                  buildProduct(
                                                      HomeCubit.get(context)
                                                          .dryFruit[index],
                                                      context,
                                                      index,size),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      SizedBox(
                                                        width: size.width * 0.02,
                                                      ),
                                              scrollDirection: Axis.horizontal,
                                              //shrinkWrap: true,
                                              itemCount: HomeCubit.get(context)
                                                  .dryFruit
                                                  .length,
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          const Header(
                                            title: 'Mixed Dry Fruits Pack',
                                            text: 'Dry Fruit mix fresh pack',
                                            offer: '(10% Off)',
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Container(
                                            height: size.height * 0.25,
                                            child: ListView.separated(
                                              itemBuilder: (context, index) =>
                                                  buildProduct(
                                                      HomeCubit.get(context)
                                                              .mixedDryFruits[
                                                          index],
                                                      context,
                                                      index,size),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      SizedBox(
                                                        width: size.width * 0.02,
                                                      ),
                                              scrollDirection: Axis.horizontal,
                                              //shrinkWrap: true,
                                              itemCount: HomeCubit.get(context)
                                                  .mixedDryFruits
                                                  .length,
                                            ),
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          const Header(
                                            title: 'Dehiscent Dry Fruits',
                                            text: 'Fresh Dehiscent Dry Fruits',
                                            offer: '(20% Off)',
                                          ),
                                          SizedBox(
                                            height: size.height * 0.02,
                                          ),
                                          Container(
                                            height: size.height * 0.25,
                                            child: ListView.separated(
                                              itemBuilder: (context, index) =>
                                                  buildProduct(
                                                      HomeCubit.get(context)
                                                              .dehiscentDryFruits[
                                                          index],
                                                      context,
                                                      index,size),
                                              separatorBuilder:
                                                  (context, index) =>
                                                      SizedBox(
                                                        width: size.width * 0.02,
                                                      ),
                                              scrollDirection: Axis.horizontal,
                                              //shrinkWrap: true,
                                              itemCount: HomeCubit.get(context)
                                                  .dehiscentDryFruits
                                                  .length,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            fallback: (context) =>
                const Center(child: CircularProgressIndicator()),
          );
        },
      ),
    );
  }
}

Widget buildProduct(ProductModel productModel, context, index,Size size) => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              height: size.height * 0.18,
              width: size.width * 0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  20,
                ),
                image: DecorationImage(
                  image: NetworkImage(
                    '${productModel.image}',
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  HomeCubit.get(context).favoriteProduct(HomeCubit.get(context).favorite[index]);
                },
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 16,
                  child: Icon(
                    HomeCubit.get(context).icon,
                    color: HomeCubit.get(context).iconColor,
                  ),
                ),
              ),
            ),
          ],
        ),
        RatingBar.builder(
          initialRating: productModel.rating,
          minRating: 1,
          itemSize: 20,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemBuilder: (context, _) => const Icon(
            Icons.star,
            size: 15,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {},
        ),
        Text(
          '${productModel.name}',
        ),
        Text(
          '${productModel.mass}',
        ),
      ],
    );
