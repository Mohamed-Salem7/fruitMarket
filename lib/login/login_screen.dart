import 'package:buildcondition/buildcondition.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/Home_Screen/Main_Screen.dart';
import 'package:fruit/cache.dart';
import 'package:fruit/constant.dart';
import 'package:fruit/Home_Screen/home_screen.dart';
import 'package:fruit/login/cubit/login_cubit.dart';
import 'package:fruit/login/cubit/login_state.dart';
import 'package:fruit/register/Register_Screen.dart';
import 'package:get/get.dart';
import 'package:toast/toast.dart';

void showToast(String msg, {int? duration, int? gravity}) {
  Toast.show(msg, duration: duration, gravity: gravity);
}

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();
    var emailController = TextEditingController();
    var passwordController = TextEditingController();
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) => {
          if (state is LoginSuccessState)
            {
              CacheHelper.saveData(
                key: 'uId',
                value: state.uid,
              ).then(
                (value) => navigatorFinished(context,
                  const MainScreen(),
                ),
              ),
            },
          if(state is LoginSuccessWithGoogleState) {
            navigatorFinished(context,const MainScreen()),
          },
          if (state is LoginErrorState)
            {
              RaisedButton(
                onPressed: () {
                  showToast("Show Toast", gravity: Toast.center);
                },
                child: const Text(
                  "Please Check your email or password",
                ),
              ),
            }
        },
        builder: (context, state) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage(
                            'images/1.png',
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Text(
                          "Login Fruit Market",
                          style: TextStyle(
                            fontSize: 40,
                            fontStyle: FontStyle.italic,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightGreen,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightGreen,
                          ),
                          child: TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            onTap: () {},
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                            ),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter your email";
                              }
                              return null;
                            },
                            decoration: const InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.lightGreen,
                          ),
                          child: TextFormField(
                            controller: passwordController,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w400,
                            ),
                            obscureText: LoginCubit.get(context).isPassword,
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Password',
                              hintStyle: const TextStyle(
                                color: Colors.white,
                              ),
                              prefixIcon: const Icon(
                                Icons.lock_outline,
                                color: Colors.white,
                              ),
                              suffixIcon: LoginCubit.get(context).suffix != null
                                  ? IconButton(
                                      onPressed: () {
                                        LoginCubit.get(context)
                                            .changePasswordShown();
                                      },
                                      icon: Icon(
                                        LoginCubit.get(context).suffix,
                                        color: Colors.white,
                                      ),
                                    )
                                  : null,
                            ),
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Please Enter your password';
                              }
                              return null;
                            },
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        BuildCondition(
                          condition: state is! LoginLoadingState,
                          builder: (context) => InkWell(
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                LoginCubit.get(context).userLogin(
                                  email: emailController.text,
                                  password: passwordController.text,
                                );
                              }
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.lightGreen,
                              ),
                              child: const Center(
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                    fontSize: 26,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          fallback: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "Don\'t hava an account ?",
                              style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w300,
                                color: Colors.grey[600],
                              ),
                            ),
                            TextButton(
                              onPressed: ()
                              {
                                Get.to(RegisterScreen());
                              },
                              child: const Text(
                                "Registers",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BuildCondition(
                          condition: state is! LoginLoadingState,
                          builder: (context) => InkWell(
                            onTap: () {
                              LoginCubit.get(context).signInWithGoogle();
                            },
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                color: Colors.lightGreen,
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                        'images/google.png',
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Login Google',
                                      style: TextStyle(
                                        color: Colors.white,
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
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
