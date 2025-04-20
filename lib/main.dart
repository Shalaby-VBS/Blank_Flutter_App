import 'package:blank_flutter_project/core/di/di.dart';
import 'package:blank_flutter_project/core/helpers/app_localizations.dart';
import 'package:blank_flutter_project/core/helpers/bloc_observer_checker.dart';
import 'package:blank_flutter_project/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await EasyLocalization.ensureInitialized();
  setupDI();
  Bloc.observer = const BlocObserverChecker();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    EasyLocalization(
      supportedLocales: AppLocalizations.supportedLocales,
      fallbackLocale: AppLocalizations.english,
      path: AppLocalizations.translationsPath,
      startLocale: AppLocalizations.english,
      saveLocale: true,
      child: const MyApp(),
    ),
  );
}
