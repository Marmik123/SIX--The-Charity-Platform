import 'dart:convert';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:six/app/data/remote/notifications/local_notifications.dart';

FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

FirebaseMessaging get firebaseMessagingInstance => _firebaseMessaging;

Future<String?> pushNotificationToken() async {
  return await _firebaseMessaging.getToken();
}

void notificationActions({
  @required Function(RemoteMessage?)? action,
  bool localNotification = false,
  Function(Map<String, dynamic>)? localNotificationAction,
}) {
  //Make sure that the [localNotificationAction] is not null when
  //localNotification is [true]
  assert(localNotification && (localNotificationAction != null));

  if (Platform.isIOS) {
    requestPermissions();
  }

  if (localNotification) {
    FlutterLocalNotificationHelper().initializeSettings(
      actionCallback: localNotificationAction,
    );
  }

  _firebaseMessaging.getInitialMessage().then((message) {
    action!(message);
  });

  FirebaseMessaging.onMessage.listen((message) {
    action!(message);
    if (localNotification) {
      FlutterLocalNotificationHelper().showNotificationWithDefaultSound(
        title: message.notification?.title,
        body: message.notification?.body,
        payload: jsonEncode(message.data),
      );
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((message) {
    action!(message);
  });
}

void requestPermissions() {
  _firebaseMessaging.requestPermission(
    sound: true,
    badge: true,
    alert: true,
    provisional: true,
  );
}
