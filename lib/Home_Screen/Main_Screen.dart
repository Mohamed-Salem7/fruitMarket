import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/Home_Screen/cubit/cubit.dart';
import 'package:fruit/Home_Screen/cubit/state.dart';
import 'package:fruit/Home_Screen/models/Product_Model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BuildCondition(
      condition: true,
      builder: (context) => BlocProvider(
        create: (context) => HomeCubit()..getUserData()..getFavoriteVegetables(),
        child: BlocConsumer<HomeCubit,HomeState>(
          listener: (context, state) {} ,
          builder: (context,state)
          {
            HomeCubit homeCubit = HomeCubit.get(context);
            return Scaffold(
              body: homeCubit.screens[homeCubit.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                selectedItemColor: Colors.lightGreen,
                unselectedItemColor: Colors.grey,
                backgroundColor: Colors.grey[100],
                type: BottomNavigationBarType.fixed,
                items: homeCubit.items,
                currentIndex: homeCubit.currentIndex,
                onTap: (int index)
                {
                  homeCubit.changeScreen(index);
                },
              ),
            );
          },
        ),
      ),
      fallback: (context) => Center(child: CircularProgressIndicator(),),
    );
  }
}
