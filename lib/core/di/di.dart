import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import '../../modules/login/data/remote/login_api_service.dart';
import '../../modules/login/data/repos/login_repo.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

void registerServiceAndRepo<TApiService extends Object, TRepo extends Object>({
  required TApiService Function(Dio dio) apiService,
  required TRepo Function(TApiService service) repo,
}) {
  if (!getIt.isRegistered<TApiService>()) {
    getIt.registerLazySingleton<TApiService>(() => apiService(getIt<Dio>()));
  }
  if (!getIt.isRegistered<TRepo>()) {
    getIt.registerLazySingleton<TRepo>(() => repo(getIt<TApiService>()));
  }
}

Future<void> setupDI() async {
  // Dio & ApiService.
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  // Login Module
  registerServiceAndRepo<LoginApiService, LoginRepo>(
    apiService: (dio) => LoginApiService(dio),
    repo: (service) => LoginRepo(service),
  );
}
