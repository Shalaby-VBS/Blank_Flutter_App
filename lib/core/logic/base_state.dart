sealed class BaseState {}

class InitialState extends BaseState {}

class LoadingState extends BaseState {}

class SuccessState<T> extends BaseState {
  final T data;

  SuccessState(this.data);
}

class ErrorState extends BaseState {
  final String message;
  final Exception? exception;

  ErrorState(this.message, [this.exception]);
}
