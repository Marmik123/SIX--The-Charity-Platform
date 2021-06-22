import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get_x_starter_kit/app/data/config/logger.dart';
import 'package:get_x_starter_kit/app/data/local/locale_provider.dart';
import 'package:get_x_starter_kit/app/data/local/theme_provider.dart';
import 'package:get_x_starter_kit/app/data/local/user_provider.dart';
import 'package:get_x_starter_kit/app/data/remote/api_service/init_api_service.dart';
import 'package:get_x_starter_kit/app/data/remote/notifications/firebase_notifications.dart';
import 'package:get_x_starter_kit/app/data/remote/notifications/notification_actions.dart';

late String kDevelopmentApiBaseUrl;
late String kProductionApiBaseUrl;

Future<void> initializeCoreApp({
  bool firebaseApp = true,
  bool setupLocalNotifications = false,
  bool encryption = false,
  @required String? developmentApiBaseUrl,
  @required String? productionApiBaseUrl,
}) async {
  //Activate logger
  initLogger();

  //Firebase products initializations
  if (firebaseApp) {
    await Firebase.initializeApp();
    notificationActions(
      action: notificationAction,
      localNotification: setupLocalNotifications,
      localNotificationAction: localNotificationAction,
    );
  }
  if (developmentApiBaseUrl != null) {
    kDevelopmentApiBaseUrl = developmentApiBaseUrl;
  }
  if (productionApiBaseUrl != null) {
    kProductionApiBaseUrl = productionApiBaseUrl;
  }

  await GetStorage.init();
  UserProvider.loadUser();
  LocaleProvider.loadCurrentLocale();
  await ThemeProvider.getThemeModeFromStore();

  if (productionApiBaseUrl != null || developmentApiBaseUrl != null) {
    APIService.initializeAPIService(
      encryptData: encryption,
    );
  }
}
