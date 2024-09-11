import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:blank_flutter_project/modules/login/api/models/login_response.dart';
import 'package:blank_flutter_project/modules/login/api/models/login_request_body.dart';
import 'api_urls.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiUrls.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiUrls.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
}
