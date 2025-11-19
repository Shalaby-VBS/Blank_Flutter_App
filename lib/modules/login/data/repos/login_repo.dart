import 'package:blank_flutter_project/core/networking/api_result.dart';
import 'package:blank_flutter_project/core/utils/api_utils.dart';
import 'package:blank_flutter_project/modules/login/data/models/login_response.dart';
import 'package:blank_flutter_project/modules/login/data/models/login_request.dart';
import 'package:blank_flutter_project/modules/login/data/remote/login_api_service.dart';

class LoginRepo {
  final LoginApiService _loginApiService;

  LoginRepo(this._loginApiService);

  Future<ApiResult<LoginResponse>> login({required LoginRequest loginRequest}) {
    return ApiUtils.executeRepoCall<LoginResponse>(
      call: () => _loginApiService.login(loginRequest),
      name: "Login",
      mapper: (response) => response.data,
    );
  }
}
