import 'package:blank_flutter_project/core/config/flavor_config.dart';
import 'package:blank_flutter_project/core/di/di.dart';
import 'package:blank_flutter_project/core/helpers/app_localizations.dart';
import 'package:blank_flutter_project/my_app.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../utils/utils.dart';

class AppInitializer {
  static Future<void> initializeApp({required bool isDevelopment}) async {
    WidgetsFlutterBinding.ensureInitialized();
    await EasyLocalization.ensureInitialized();

    FlavorConfig.setup(
      flavor: isDevelopment ? Flavor.development : Flavor.production,
    );
    setupDI();
    Utils.setBlocObserver();
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
}
