import 'dart:async';

import 'package:catcher/catcher.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:six/app/data/config/design_config.dart';
import 'package:six/app/data/config/error_handling.dart';
import 'package:six/app/data/config/initialize_app.dart';
import 'package:six/app/data/config/translation_api.dart';
import 'package:six/app/data/local/locale_provider.dart';
import 'package:six/app/utils/main_utils.dart';

import 'app/routes/app_pages.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //TODO: Encryption - exclude for media
  //TODO: Social Login
  //TODO: Force update

  //Making Status Bar Transparent
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status bar
  ));

  /// Debug configuration with dialog report mode and console handler. It will show dialog and once user accepts it, error will be shown   /// in console.
  var debugOptions = CatcherOptions(PageReportMode(), [
    ConsoleHandler(),
  ]);

  /// Release configuration. Same as above, but once user accepts dialog, user will be prompted to send email with crash to support.
  var releaseOptions = CatcherOptions(DialogReportMode(), [
    DiscordHandler(
      'https://discordapp.com/api/webhooks/862198856510472212/2c7RpczFiIYW8nyoV-gO47XXKBga_827wCAdFZbG2IplAxjWA5oVQ2M5zLntVOZchXQi',
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
    navigatorKey: Catcher.navigatorKey,
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
            encryption: true,
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
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      letMeHandleAllErrors(
        errorDetails.exception,
        errorDetails.stack,
      );
      if (kReleaseMode) {
        Catcher.reportCheckedError(errorDetails.exception, errorDetails.stack);
      }
    });
  };
}

class StartTheApp extends StatelessWidget {
  const StartTheApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        hideKeyboard();
      },
      child: ScreenUtilInit(
        designSize: const Size(
          DesignConfig.kDesignWidth,
          DesignConfig.kDesignHeight,
        ),
        builder: () {
          return GetMaterialApp(
            title: 'SIX-The Charity Platform',
            navigatorKey: Catcher.navigatorKey,
            theme: ThemeData(
              primarySwatch: Colors.blueGrey,
            ),
            initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
            translationsKeys: Get.find<AppTranslations>().keys,
            translations: Get.find<AppTranslations>(),
            locale: LocaleProvider.currentLocale,
            fallbackLocale: const Locale('en_US'),
            defaultTransition: Transition.cupertino,
            themeMode: ThemeMode.system,
          );
        },
      ),
    );
  }
}
