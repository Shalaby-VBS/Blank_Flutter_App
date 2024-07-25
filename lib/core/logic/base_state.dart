sealed class BaseState {}

class Initial extends BaseState {}

class Loading extends BaseState {}

class Success<T> extends BaseState {
  // final T data;

  // Success({required this.data});
}

class Error<T> extends BaseState {
  final T error;

  Error({required this.error});
}
