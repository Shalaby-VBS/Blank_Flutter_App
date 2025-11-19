import 'api_error_model.dart';

abstract class ApiResult<T> {
  const ApiResult();

  R when<R>({
    required R Function(T data) success,
    required R Function(ApiErrorModel error) failure,
  }) {
    if (this is ApiResultSuccess<T>) {
      return success((this as ApiResultSuccess<T>).data);
    } else if (this is ApiResultFailure<T>) {
      return failure((this as ApiResultFailure<T>).apiErrorModel);
    }
    throw Exception('Unknown subtype of ApiResult');
  }
}

class ApiResultSuccess<T> extends ApiResult<T> {
  final T data;
  const ApiResultSuccess(this.data);
}

class ApiResultFailure<T> extends ApiResult<T> {
  final ApiErrorModel apiErrorModel;
  const ApiResultFailure(this.apiErrorModel);
}
