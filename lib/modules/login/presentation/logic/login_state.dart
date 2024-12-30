import 'package:blank_flutter_project/modules/login/data/models/login_response.dart';

sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess<T> extends LoginState {
  final LoginResponse data;
  LoginSuccess(this.data);
}

class LoginError extends LoginState {
  final String message;
  LoginError(this.message);
}

class PasswordVisibilityChanged extends LoginState {
  final bool isVisible;
  PasswordVisibilityChanged(this.isVisible);
}
