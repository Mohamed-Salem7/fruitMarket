import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/Home_Screen/cubit/cubit.dart';
import 'package:fruit/Home_Screen/cubit/state.dart';
import 'package:iconsax/iconsax.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(),
      child: BlocConsumer<HomeCubit,HomeState>(
        listener: (context,state){},
        builder: (context,state)
        {
          Size size = MediaQuery.of(context).size;
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              backgroundColor: Colors.lightGreen,
              title: const Text('Shopping Cart'),
            ),
            body: SafeArea(
              child: Column(
                children: [
                   SizedBox(
                    height: size.height * 0.02,
                  ),
                  Container(
                    height: size.height * 0.05,
                    width: double.infinity,
                    color: Colors.grey[200],
                    child: const Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text('Vegetables'),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: size.height * 0.15,
                          width: size.width * 0.32,
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
                                  const Text(
                                    'Broccoli',
                                    style: TextStyle(
                                        fontSize: 20, fontWeight: FontWeight.w300),
                                  ),
                                  const Spacer(),
                                  const Text(
                                    'Rs 40 saved',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w300,
                                        color: Colors.green),
                                  ),
                                  const Spacer(),
                                  IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.delete,
                                    ),
                                  ),
                                ],
                              ),
                               SizedBox(
                                height: size.height * 0.001,
                              ),
                              const Text(
                                'Rs 190',
                                style: TextStyle(
                                  decoration: TextDecoration.lineThrough,
                                  inherit: true,
                                  textBaseline: TextBaseline.ideographic,
                                ),
                              ),
                              SizedBox(
                                height: size.height * 0.01,
                              ),
                              const Text(
                                '150 Per/kg',
                                style: TextStyle(fontSize: 14),
                              ),
                              Row(
                                children: [
                                  Spacer(),
                                  InkWell(
                                    onTap: ()
                                    {
                                      HomeCubit.get(context).decreaseNumber();
                                    },
                                    child: Container(
                                      height: size.height * 0.035,
                                      width: size.width * 0.08,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: Colors.white,
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset.fromDirection(0, 0),
                                                spreadRadius: 0.8)
                                          ]),
                                      child: const Center(
                                        child: Icon(Iconsax.minus),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * 0.05,
                                  ),
                                   Text(
                                    '${HomeCubit.get(context).number}',
                                    style: const TextStyle(fontSize: 18),
                                  ),
                                  SizedBox(
                                    width: size.width *0.05,
                                  ),
                                  InkWell(
                                    onTap: ()
                                    {
                                      HomeCubit.get(context).increaseNumber();
                                    },
                                    child: Container(
                                      height: size.height * 0.035,
                                      width: size.width * 0.08,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          color: Colors.white,
                                          boxShadow: <BoxShadow>[
                                            BoxShadow(
                                                color: Colors.grey,
                                                offset: Offset.fromDirection(0, 0),
                                                spreadRadius: 0.8)
                                          ]),
                                      child: const Center(
                                        child: Icon(Iconsax.add),
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
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
