import 'package:blank_flutter_project/core/dependency_injection/di.dart';
import 'package:blank_flutter_project/core/routing/app_routes.dart';
import 'package:blank_flutter_project/modules/login/logic/login_cubit.dart';
import 'package:blank_flutter_project/modules/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();
  static BuildContext? currentContext = navigatorKey.currentContext;
  Route generateRoute(RouteSettings settings) {
    // final arguments = settings.arguments;
    switch (settings.name) {
      case AppRoutes.loginScreen:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => getIt<LoginCubit>(),
            child: const LoginScreen(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
