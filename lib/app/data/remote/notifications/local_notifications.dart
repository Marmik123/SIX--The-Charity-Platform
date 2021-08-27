/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:six/app/data/config/logger.dart';

class FlutterLocalNotificationHelper {
  FlutterLocalNotificationHelper._();

  static final FlutterLocalNotificationHelper _instance =
      FlutterLocalNotificationHelper._();

  factory FlutterLocalNotificationHelper() => _instance;

  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;

  late Function(Map<String, dynamic>) localNotificationCallback;

  Future<void> initializeSettings({
    @required Function(Map<String, dynamic>)? actionCallback,
  }) async {
    if (actionCallback != null) {
      localNotificationCallback = actionCallback;
    }
    var initializationSettingsAndroid =
        const AndroidInitializationSettings('app_icon');
    var initializationSettingsIOS = const IOSInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    //On notification click
    final notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails?.didNotificationLaunchApp ?? false) {
      await onSelectNotification(notificationAppLaunchDetails?.payload);
    }
  }

  // WHEN USER CLICKS TO NOTIFICATION
  Future onSelectNotification(String? payload) async {
    logD('Payload :: $payload');
    if (payload != null) {
      var payloadJson = (jsonDecode(payload) as Map<String, dynamic>);
      localNotificationCallback(payloadJson);
    }
  }

  // SHOW LOCAL NOTIFICATION
  //  'your channel id', 'your channel name', 'your channel description', IS NOT NEEDED
  Future showNotificationWithDefaultSound(
      {@required String? title,
      @required String? body,
      @required String? payload}) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        'your channel id', 'your channel name', 'your channel description',
        importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = const IOSNotificationDetails();
    var platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: payload,
    );
  }
}
*/
