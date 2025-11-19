import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'package:blank_flutter_project/core/networking/api_base_response.dart';
import 'package:blank_flutter_project/core/networking/api_urls.dart';
import 'package:blank_flutter_project/modules/login/data/models/login_request.dart';
import 'package:blank_flutter_project/modules/login/data/models/login_response.dart';

part 'login_api_service.g.dart';

@RestApi()
abstract class LoginApiService {
  factory LoginApiService(Dio dio) = _LoginApiService;

  @POST(ApiUrls.login)
  Future<ApiBaseResponse<LoginResponse>> login(@Body() LoginRequest loginRequest);
}
