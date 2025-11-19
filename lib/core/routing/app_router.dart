import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:blank_flutter_project/core/di/di.dart';
import 'package:blank_flutter_project/core/routing/app_routes.dart';
import 'package:blank_flutter_project/core/screens/not_found_screen.dart';
import 'package:blank_flutter_project/modules/login/presentation/logic/login_cubit.dart';
import 'package:blank_flutter_project/modules/login/presentation/screens/login_screen.dart';
import 'package:blank_flutter_project/modules/onboarding/presentation/logic/onboarding_cubit.dart';
import 'package:blank_flutter_project/modules/onboarding/presentation/screens/onboarding_screen.dart';
import 'package:blank_flutter_project/modules/splash/presentation/screens/splash_screen.dart';

class AppRouter {
  AppRouter._();

  static final GlobalKey<NavigatorState> navigatorKey =
      GlobalKey<NavigatorState>();

  static BuildContext? get currentContext => navigatorKey.currentContext;

  static String get initialRoute => AppRoutes.splash;

  /// Route configuration - maps route names to widgets
  static final Map<String, WidgetBuilder> _routes = {
    AppRoutes.splash: (_) => const SplashScreen(),
    AppRoutes.onboarding: (_) => BlocProvider(
          create: (_) => OnboardingCubit(),
          child: const OnboardingScreen(),
        ),
    AppRoutes.login: (_) => BlocProvider(
          create: (context) => LoginCubit(getIt()),
          child: const LoginScreen(),
        ),
    // AppRoutes.home: (_) => const HomeScreen(),
  };

  /// Generate routes with support for arguments and deep linking
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    final String routeName = settings.name ?? '';

    if (_routes.containsKey(routeName)) {
      return MaterialPageRoute(
        settings: settings,
        builder: _routes[routeName]!,
      );
    }

    final matchedRoute = _findParameterizedRoute(routeName);
    if (matchedRoute != null) {
      return MaterialPageRoute(
        settings: settings,
        builder: matchedRoute,
      );
    }

    return MaterialPageRoute(
      settings: settings,
      builder: (_) => NotFoundScreen(routeName: routeName),
    );
  }

  static WidgetBuilder? _findParameterizedRoute(String path) => null;
}
