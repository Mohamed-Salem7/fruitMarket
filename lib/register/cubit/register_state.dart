class RegisterState {}

class InitialRegisterState extends RegisterState {}

class LoadingRegisterState extends RegisterState {}

class SuccessRegisterState extends RegisterState {}

class ErrorRegisterState extends RegisterState {
  final String error;
  ErrorRegisterState(this.error);
}


class ErrorCreateUserState extends RegisterState {
  final String error;
  ErrorCreateUserState(this.error);
}


class ChangePasswordRegisterState extends RegisterState {}