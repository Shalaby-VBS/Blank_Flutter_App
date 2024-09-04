import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../networking/api_service.dart';
import '../networking/dio_factory.dart';

final getIt = GetIt.instance;

Future<void> setupGetIt() async {
  // Dio & ApiService.
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  // Login.
  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));
  // getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
  // getIt.registerFactory<ToggleObscureTextCubit>(() => ToggleObscureTextCubit());
  // getIt.registerFactory<ToggleRememberMeCubit>(() => ToggleRememberMeCubit());
}
