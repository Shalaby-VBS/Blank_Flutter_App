import 'package:blank_flutter_project/core/networking/api_error_handler.dart';
import 'package:blank_flutter_project/core/networking/api_result.dart';
import 'package:blank_flutter_project/core/utils/utils.dart';

class ApiUtils {
  ApiUtils._();

  static Future<ApiResult<T>> executeRepoCall<T>({
    required Future<dynamic> Function() call,
    required String name,
    T Function(dynamic response)? mapper,
  }) async {
    try {
      Utils.printLog("🔵$name - Starting request...");
      final apiResponse = await call();
      final mappedResult = mapper?.call(apiResponse) ?? apiResponse as T;
      Utils.printLog("🟢$name Success=> ${mappedResult.toString()}");
      return ApiResultSuccess(mappedResult);
    } catch (error) {
      Utils.printLog("🔴$name Error=> ${error.toString()}");
      return ApiResultFailure(ApiErrorHandler.handle(error));
    }
  }
}
