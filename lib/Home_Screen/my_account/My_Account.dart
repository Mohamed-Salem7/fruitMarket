import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/Home_Screen/cubit/cubit.dart';
import 'package:fruit/Home_Screen/cubit/state.dart';
import 'package:fruit/Home_Screen/my_account/Help.dart';
import 'package:fruit/Home_Screen/my_account/Order.dart';
import 'package:fruit/Home_Screen/my_account/Setting.dart';
import 'package:fruit/constant.dart';
import 'package:fruit/login/login_screen.dart';
import 'package:fruit/register/model.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:rating/rating.dart';
import 'package:settings_ui/settings_ui.dart';
import 'package:unicons/unicons.dart';

class MyAccount extends StatelessWidget {
  const MyAccount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit()..getUserData(),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          RegisterModel? userModel = HomeCubit.get(context).registerModel;
          Size size = MediaQuery.of(context).size;
          return BuildCondition(
            condition: userModel != null,
            builder: (context) => Scaffold(
              backgroundColor: Colors.grey[200],
              body: Column(
                children: [
                  Container(
                    height: size.height * 0.35,
                    //padding: EdgeInsets.symmetric(),
                    width: double.infinity,
                    color: Colors.lightGreen,
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        Positioned(
                          top: size.height * 0.08,
                          right: size.width * 0.01,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Iconsax.user_edit,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 60,
                              backgroundColor: Colors.white,
                              child: CircleAvatar(
                                radius: 58,
                                backgroundImage:
                                    NetworkImage('${userModel!.image}'),
                              ),
                            ),
                             SizedBox(
                              height: size.height * 0.01,
                            ),
                            Text(
                              '${userModel.name}',
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              height: size.height * 0.005,
                            ),
                            Text(
                              '${userModel.email}',
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        buildItem(
                            context, 'My Orders', UniconsLine.shopping_bag, size,() {
                          Get.to(const Order());
                        }),
                        buildItem(
                            context, 'Settings', UniconsLine.setting, size,()
                        {
                          Get.to(Setting());
                        }),
                        buildItem(context, 'Rate us', Iconsax.ranking, size,()
                        {
                          final ratingModel = RatingModel(
                            id: 1,
                            title: null,
                            subtitle: 'Rate our app:',
                            ratingConfig: RatingConfigModel(
                              id: 1,
                              ratingSurvey1: 'What can we improve on?',
                              ratingSurvey2: 'What can we improve on?',
                              ratingSurvey3: 'What can we improve on?',
                              ratingSurvey4: 'What can we improve on?',
                              ratingSurvey5: 'What you liked the most?',
                              items: [
                                RatingCriterionModel(id: 1, name: 'Quality of service'),
                                RatingCriterionModel(id: 2, name: 'Competence of attendants'),
                                RatingCriterionModel(id: 3, name: 'Cleaning the environment'),
                                RatingCriterionModel(id: 4, name: 'Waiting time'),
                              ],
                            ),
                          );
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => RatingWidget(controller: MockRatingController(ratingModel)),
                          );
                        }),
                        buildItem(context, 'Refer a Friends',
                            UniconsLine.share_alt, size,() {}),
                        buildItem(context, 'Help', UniconsLine.question, size,()
                        {
                          Get.to(const Help());
                        }),
                        buildItem(context, 'Logout', Iconsax.logout, size,()
                        {
                          navigatorFinished(context, LoginScreen());
                        }),
                      ],
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

Widget buildItem(BuildContext context, String name, IconData icon,Size size,
        Function() function) =>
    InkWell(
      onTap: function,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                children: [
                  Icon(
                    icon,
                    size: 35,
                    color: Colors.lightGreen,
                  ),
                  SizedBox(
                    width: size.width * 0.01,
                  ),
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ),
            if (name != 'Logout' && name != 'Change Address')
               Divider(
                color: Colors.grey,
                height: size.height * 0.001,
              ),
          ],
        ),
      ),
    );


class MockRatingController extends RatingController {
  MockRatingController(RatingModel ratingModel) : super(ratingModel);

  @override
  Future<void> ignoreForEverCallback() async {
    print('Rating ignored forever!');
    await Future.delayed(const Duration(seconds: 3));
  }

  @override
  Future<void> saveRatingCallback(int rate, List<RatingCriterionModel> selectedCriterions) async {
    print('Rating saved!\nRate: $rate\nsSelectedItems: $selectedCriterions');
    await Future.delayed(const Duration(seconds: 3));
  }
}