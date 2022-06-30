abstract class HomeState{}

class InitialHomeScreen extends HomeState{}


class ChangeColorHomeScreen extends HomeState{}


class ChangeScreen extends HomeState{}


class GetProductSuccessfulFromFirebase extends HomeState{}

class GetProductErrorFromFirebase extends HomeState{}


class IncreaseNumber extends HomeState{}


class DecreaseNumber extends HomeState{}


class GetFavoriteProductSuccessful extends HomeState{}


class GetFavoriteProductError extends HomeState {
  final String error;
  GetFavoriteProductError(this.error);
}


class LoadingGetUserData extends HomeState {}


class SuccessGetUserData extends HomeState {}


class ErrorGetUserData extends HomeState {
  final String error;
  ErrorGetUserData(this.error);
}


class SuccessGetFavoriteProduct extends HomeState {}

class ErrorGetFavoriteProduct extends HomeState {}


class SuccessFavoriteVegetables extends HomeState {}

class ErrorFavoriteVegetables extends HomeState {}
