import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruit/Home_Screen/Favourite.dart';
import 'package:fruit/Home_Screen/my_account/My_Account.dart';
import 'package:fruit/Home_Screen/Shopping_Cart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fruit/Home_Screen/cubit/state.dart';
import 'package:fruit/Home_Screen/home_screen.dart';
import 'package:fruit/Home_Screen/models/Product_Model.dart';
import 'package:fruit/constant.dart';
import 'package:fruit/register/model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(InitialHomeScreen());

  static HomeCubit get(context) => BlocProvider.of(context);

  bool isPressed = true;

  IconData icon = Icons.favorite_border_outlined;

  Color iconColor = Colors.amber;

  void changeColors() {
    isPressed = !isPressed;
    iconColor = isPressed ? Colors.amber : Colors.red;
    icon = isPressed ? Icons.favorite_border_outlined : Icons.favorite;
    emit(ChangeColorHomeScreen());
  }

  int currentIndex = 0;

  List<Widget> screens = [
    const HomeScreen(),
    const ShoppingCart(),
    const Favourite(),
    const MyAccount(),
  ];

  void changeScreen(int index) {
    currentIndex = index;
    emit(ChangeScreen());
  }

  List<BottomNavigationBarItem> items = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home_filled),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.shopping_cart),
      label: 'Shopping Cart',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.favorite),
      label: 'Favourite',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_circle),
      label: 'My Account',
    ),
  ];

  RegisterModel? registerModel;

  Future<void> getUserData() async {
    emit(LoadingGetUserData());
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .get()
        .then((value) {
      registerModel = RegisterModel.fromJson(value.data()) ;
      emit(SuccessGetUserData());
    }).catchError((error) {
      print(error.toString());
      emit(ErrorGetUserData(error));
    });
  }

  List<ProductModel> vegetables = [];


  Future<void> getVegetables() async {
    vegetables = [];
    await FirebaseFirestore.instance.collection('organicV').get().then((value) {
      value.docs.forEach((element) {
        vegetables.add(ProductModel.fromJson(element.data()));
      });
      emit(GetProductSuccessfulFromFirebase());
    }).catchError((error) {
      print(error.toString());
      emit(GetProductErrorFromFirebase());
    });
  }



  bool isFavourite = false;

  void CheckFavourite({
    required ProductModel model,
  }) {
    isFavourite = false;
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .collection('favorite')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        if (element.id == model.uId) {
          deleteFavouriteProduct(model: model);
          isFavourite = true;
        }
      });
      if (!isFavourite) {
        sendFavouriteProduct(model: model);
      }
    }).catchError((error) {
      emit(CheckFavouriteErrorState(error));
    });
  }

  List<ProductModel> productModel = [];

  void getFavouriteProduct() {
    print(uId);
    emit(GetFavouriteLoadingState());
    productModel = [];
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .collection('favorite')
        .snapshots()
        .listen((event) {
      productModel = [];
      event.docs.forEach((element) {
        productModel.add(ProductModel.fromJson(element.data()));
      });
      emit(GetFavouriteSuccessState());
    });
  }

  void sendFavouriteProduct({
    required ProductModel model,
  }) {
    String uid = model.uId;
    emit(SetFavouriteLoadingState());
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .collection('favorite')
        .doc(uid)
        .set(model.toMap())
        .then((value) {
      emit(SetFavouriteSuccessState());
    }).catchError((error) {
      emit(SetFavouriteErrorState(error.toString()));
    });
  }

  void deleteFavouriteProduct({
    required ProductModel model,
  }) {
    emit(DeleteFavouriteLoadingState());
    String uid = model.uId;
    FirebaseFirestore.instance
        .collection('user')
        .doc(uId)
        .collection('favorite')
        .doc(uid)
        .delete()
        .then((value) {
      emit(DeleteFavouriteSuccessState());
    }).catchError((error) {
      emit(DeleteFavouriteErrorState(error.toString()));
    });
  }





  List<ProductModel> mixedVegetables = [];

  Future<void> getMixedVegetables() async {
    mixedVegetables = [];
    await FirebaseFirestore.instance
        .collection('mixedVegetables')
        .get()
        .then((value) {
      value.docs.forEach(
        (element) {
          mixedVegetables.add(ProductModel.fromJson(element.data()));
        },
      );
      emit(GetProductSuccessfulFromFirebase());
    }).catchError((error) {
      print(error.toString());
      emit(GetProductErrorFromFirebase());
    });
  }

  List<ProductModel> alliumVegetabels = [];

  Future<void> getAlliumVegetabels() async {
    alliumVegetabels = [];
    await FirebaseFirestore.instance
        .collection('alliumVegetabels')
        .get()
        .then((value) {
      value.docs.forEach(
        (element) {
          alliumVegetabels.add(ProductModel.fromJson(element.data()));
        },
      );
      emit(GetProductSuccessfulFromFirebase());
    }).catchError((error) {
      print(error.toString());
      emit(GetProductErrorFromFirebase());
    });
  }

  List<ProductModel> fruit = [];

  Future<void> getFruits() async {
    fruit = [];
    await FirebaseFirestore.instance.collection('fruit').get().then((value) {
      value.docs.forEach(
        (element) {
          fruit.add(ProductModel.fromJson(element.data()));
        },
      );
      emit(GetProductSuccessfulFromFirebase());
    }).catchError((error) {
      print(error.toString());
      emit(GetProductErrorFromFirebase());
    });
  }

  List<ProductModel> mixedFruits = [];

  Future<void> getMixedFruits() async {
    mixedFruits = [];
    await FirebaseFirestore.instance
        .collection('mixedFruits')
        .get()
        .then((value) {
      value.docs.forEach(
        (element) {
          mixedFruits.add(ProductModel.fromJson(element.data()));
        },
      );
      emit(GetProductSuccessfulFromFirebase());
    }).catchError((error) {
      print(error.toString());
      emit(GetProductErrorFromFirebase());
    });
  }

  List<ProductModel> stoneFruit = [];

  Future<void> getStoneFruit() async {
    stoneFruit = [];
    await FirebaseFirestore.instance
        .collection('stoneFruit')
        .get()
        .then((value) {
      value.docs.forEach(
        (element) {
          stoneFruit.add(ProductModel.fromJson(element.data()));
        },
      );
      emit(GetProductSuccessfulFromFirebase());
    }).catchError((error) {
      print(error.toString());
      emit(GetProductErrorFromFirebase());
    });
  }

  List<ProductModel> dryFruit = [];

  Future<void> getDryFruits() async {
    dryFruit = [];
    await FirebaseFirestore.instance.collection('dryFruit').get().then((value) {
      value.docs.forEach(
        (element) {
          dryFruit.add(ProductModel.fromJson(element.data()));
        },
      );
      emit(GetProductSuccessfulFromFirebase());
    }).catchError((error) {
      print(error.toString());
      emit(GetProductErrorFromFirebase());
    });
  }

  List<ProductModel> mixedDryFruits = [];

  Future<void> getMixedDryFruits() async {
    mixedDryFruits = [];
    await FirebaseFirestore.instance
        .collection('mixedDryFruits')
        .get()
        .then((value) {
      value.docs.forEach(
        (element) {
          mixedDryFruits.add(ProductModel.fromJson(element.data()));
        },
      );
      emit(GetProductSuccessfulFromFirebase());
    }).catchError((error) {
      print(error.toString());
      emit(GetProductErrorFromFirebase());
    });
  }

  List<ProductModel> dehiscentDryFruits = [];

  Future<void> getDehiscentDryFruits() async {
    dehiscentDryFruits = [];
    await FirebaseFirestore.instance
        .collection('dehiscentDryFruits')
        .get()
        .then((value) {
      value.docs.forEach(
        (element) {
          dehiscentDryFruits.add(ProductModel.fromJson(element.data()));
        },
      );
      emit(GetProductSuccessfulFromFirebase());
    }).catchError((error) {
      print(error.toString());
      emit(GetProductErrorFromFirebase());
    });
  }

  int number = 1;

  void increaseNumber() {
    number++;
    emit(IncreaseNumber());
  }

  void decreaseNumber() {
    if (number > 1) number--;
    emit(IncreaseNumber());
  }
}
