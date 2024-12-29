import 'package:blank_flutter_project/core/networking/api_result.dart';
import 'package:blank_flutter_project/modules/login/data/models/login_response.dart';
import 'package:blank_flutter_project/modules/login/data/models/login_request.dart';
import 'package:blank_flutter_project/core/networking/api_error_handler.dart';
import 'package:blank_flutter_project/modules/login/data/remote/login_api_service.dart';

class LoginRepo {
  final LoginApiService _loginApiService;

  LoginRepo(this._loginApiService);

  Future<ApiResult<LoginResponse>> login(LoginRequest loginRequest) async {
    try {
      final response = await _loginApiService.login(loginRequest);
      return ApiResult.success(response);
    } catch (error) {
      throw ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
