sealed class BaseStates {}

class Initial extends BaseStates {}

class Loading extends BaseStates {}

class Success extends BaseStates {
  final dynamic data;

  Success(this.data);
}

class Error extends BaseStates {
  final String message;

  Error(this.message);
}
