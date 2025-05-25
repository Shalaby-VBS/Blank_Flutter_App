abstract class ApiResult<T> {
  R when<R>({
    required R Function(T data) success,
    required R Function(String error) failure,
  });
}

class Success<T> extends ApiResult<T> {
  final T data;
  Success(this.data);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(String error) failure,
  }) {
    return success(data);
  }
}

class Failure<T> extends ApiResult<T> {
  final String error;
  Failure(this.error);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(String error) failure,
  }) {
    return failure(error);
  }
}
