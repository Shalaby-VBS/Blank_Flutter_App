sealed class BaseState {}

class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class SuccessState<T> extends BaseState {
  final T data;

  SuccessState({required this.data});
}

class ErrorState<T> extends BaseState {
  final T error;

  ErrorState({required this.error});
}
