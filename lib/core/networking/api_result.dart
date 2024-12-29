import 'package:blank_flutter_project/core/networking/api_error_model.dart';

abstract class ApiResult<T> {
  factory ApiResult.success(T data) = _Success<T>;
  factory ApiResult.failure(ApiErrorModel error) = _Failure<T>;

  R when<R>({
    required R Function(T data) success,
    required R Function(ApiErrorModel error) failure,
  });
}

class _Success<T> implements ApiResult<T> {
  final T data;
  _Success(this.data);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(ApiErrorModel error) failure,
  }) {
    return success(data);
  }
}

class _Failure<T> implements ApiResult<T> {
  final ApiErrorModel error;
  _Failure(this.error);

  @override
  R when<R>({
    required R Function(T data) success,
    required R Function(ApiErrorModel error) failure,
  }) {
    return failure(error);
  }
}
