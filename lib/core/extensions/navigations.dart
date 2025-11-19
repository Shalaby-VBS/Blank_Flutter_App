import 'package:flutter/material.dart';
import '../routing/app_router.dart';

extension Navigations on BuildContext {
  NavigatorState? get _nav => AppRouter.navigatorKey.currentState;

  bool get canPop => _nav?.canPop() ?? false;

  Future<T?> push<T>(
    String routeName, {
    Object? arguments,
  }) async =>
      _nav?.pushNamed<T>(
        routeName,
        arguments: arguments,
      );

  Future<T?> pushAndRemoveAll<T>(
    String routeName, {
    Object? arguments,
  }) async =>
      _nav?.pushNamedAndRemoveUntil<T>(
        routeName,
        (_) => false,
        arguments: arguments,
      );

  Future<T?> pushAndRemoveUntil<T>(
    String routeName,
    bool Function(Route<dynamic>) predicate, {
    Object? arguments,
  }) async =>
      _nav?.pushNamedAndRemoveUntil<T>(
        routeName,
        predicate,
        arguments: arguments,
      );

  Future<T?> pushReplacement<T extends Object?>(
    String routeName, {
    Object? arguments,
  }) async =>
      _nav?.pushReplacementNamed<T, Object?>(
        routeName,
        arguments: arguments,
      );

  void pop<T>([T? result]) {
    if (_nav?.canPop() ?? false) {
      _nav?.pop<T>(result);
    }
  }

  void popUntil(String routeName) =>
      _nav?.popUntil(ModalRoute.withName(routeName));
}
