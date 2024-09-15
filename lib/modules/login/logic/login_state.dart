sealed class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess<T> extends LoginState {
  final T data;
  LoginSuccess({required this.data});
}

class LoginError<T> extends LoginState {
  final T error;
  LoginError({required this.error});
}

class PasswordVisibilityChangedState extends LoginState {
  final bool isPasswordVisible;
  PasswordVisibilityChangedState(this.isPasswordVisible);
}
