import 'package:blank_flutter_project/core/networking/api_result.dart';
import 'package:blank_flutter_project/core/networking/api_service.dart';
import 'package:blank_flutter_project/modules/login/api/models/login_response.dart';
import 'package:blank_flutter_project/modules/login/api/models/login_request_body.dart';
import 'package:blank_flutter_project/core/networking/api_error_handler.dart';
class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (error) {
      throw ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
