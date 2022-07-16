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


class GetFavouriteLoadingState extends HomeState {}

class GetFavouriteSuccessState extends HomeState {}


class SetFavouriteLoadingState extends HomeState {}

class SetFavouriteSuccessState extends HomeState {}

class DeleteFavouriteLoadingState extends HomeState {}

class DeleteFavouriteSuccessState extends HomeState {}


class CheckFavouriteErrorState extends HomeState {
  final String error;
  CheckFavouriteErrorState(this.error);
}

class SetFavouriteErrorState extends HomeState {
  final String error;
  SetFavouriteErrorState(this.error);
}

class DeleteFavouriteErrorState extends HomeState {
  final String error;
  DeleteFavouriteErrorState(this.error);
}


class LoadingWishListProduct extends HomeState {}

class SuccessWishListProduct extends HomeState {}

class ErrorWishListProduct extends HomeState {
  final String error;
  ErrorWishListProduct(this.error);
}

class LoadingDeleteWishListProduct extends HomeState {}

class SuccessDeleteWishListProduct extends HomeState {}

class GetWishlistLoadingState extends HomeState {}

class GetWishlistSuccessState extends HomeState {}

class ErrorDeleteWishListProduct extends HomeState {
  final String error;
  ErrorDeleteWishListProduct(this.error);
}
