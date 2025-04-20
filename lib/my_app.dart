import 'package:blank_flutter_project/core/routing/app_router.dart';
import 'package:blank_flutter_project/core/themes/app_colors.dart';
import 'package:blank_flutter_project/modules/media_example/media_example_screen.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'My App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: AppColors.primary,
          scaffoldBackgroundColor: Colors.white,
        ),
        builder: (context, child) {
          return MediaQuery(
            data: MediaQuery.of(context)
                .copyWith(textScaler: const TextScaler.linear(1)),
            child: child!,
          );
        },
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        onGenerateRoute: AppRouter.instance.generateRoute,
        // initialRoute: AppRoutes.loginScreen,
        navigatorKey: AppRouter.navigatorKey,
        home: const MediaExampleScreen(),
      ),
    );
  }
}
