import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_x_starter_kit/app/data/config/app_themes.dart';
import 'package:get_x_starter_kit/app/data/config/design_config.dart';
import 'package:get_x_starter_kit/app/data/config/error_handling.dart';
import 'package:get_x_starter_kit/app/data/config/initialize_app.dart';

import 'package:catcher/catcher.dart';
import 'package:get_x_starter_kit/app/data/config/translation_api.dart';
import 'package:get_x_starter_kit/app/data/local/locale_provider.dart';
import 'app/routes/app_pages.dart';

Future<void> main() async {
  //TODO: Encryption - exclude for media
  //TODO: Social Login
  //TODO: Force update

  /// Debug configuration with dialog report mode and console handler. It will show dialog and once user accepts it, error will be shown   /// in console.
  var debugOptions = CatcherOptions(PageReportMode(), [
    ConsoleHandler(),
  ]);

  /// Release configuration. Same as above, but once user accepts dialog, user will be prompted to send email with crash to support.
  var releaseOptions = CatcherOptions(DialogReportMode(), [
    DiscordHandler(
      'https://ptb.discord.com/api/webhooks/850803931922956296/ntypKkhc1XnGLxy01FZLmwCecy0VE3xZQH_5phYR3zb9Izs4aosSfcJ74_IED3BbdHDP',
      printLogs: true,
      enableApplicationParameters: true,
      enableDeviceParameters: true,
      enableStackTrace: true,
      enableCustomParameters: false,
    ),
  ]);

  Catcher(
    debugConfig: debugOptions,
    releaseConfig: releaseOptions,
    ensureInitialized: true,
    navigatorKey: GlobalKey<NavigatorState>(),
    runAppFunction: () async {
      await runZonedGuarded(
        () async {
          Get.put(AppTranslations());
          TranslationApi.loadTranslations();
          await initializeCoreApp(
            // Set it to true when including firebase app
            firebaseApp: false,
            // Set it to true if want to set local notifications for onMessage Firebase events
            setupLocalNotifications: false,
            developmentApiBaseUrl: 'developmentApiBaseUrl',
            productionApiBaseUrl: null,
            encryption: false,
          );
          runApp(
            const StartTheApp(),
          );
        },
        (error, trace) {
          letMeHandleAllErrors(error, trace);
          Catcher.reportCheckedError(error, trace);
        },
      );
    },
  );

  //Restrict orientation to Portrait
  await SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );

  FlutterError.onError = (errorDetails) {
    letMeHandleAllErrors(errorDetails.exception, errorDetails.stack);
    Catcher.reportCheckedError(errorDetails.exception, errorDetails.stack);
  };
}

class StartTheApp extends StatelessWidget {
  const StartTheApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        DesignConfig.kDesignWidth,
        DesignConfig.kDesignHeight,
      ),
      builder: () {
        return GetMaterialApp(
          navigatorKey: Catcher.navigatorKey,
          title: 'GetX CLI Starter Kit',
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          translationsKeys: Get.find<AppTranslations>().keys,
          translations: Get.find<AppTranslations>(),
          locale: LocaleProvider.currentLocale,
          fallbackLocale: const Locale('en_US'),
          defaultTransition: Transition.cupertino,
          themeMode: ThemeMode.system,
          theme: AppThemes.lightTheme,
          darkTheme: AppThemes.darkTheme,
        );
      },
    );
  }
}
