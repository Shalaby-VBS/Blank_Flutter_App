import 'package:blank_flutter_project/core/routing/app_router.dart';
import 'package:blank_flutter_project/core/themes/app_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      onGenerateRoute: AppRouter.onGenerateRoute,
      navigatorKey: AppRouter.navigatorKey,
      initialRoute: AppRouter.initialRoute,
    );
  }
}
