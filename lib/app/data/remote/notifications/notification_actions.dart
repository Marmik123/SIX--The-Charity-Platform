import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:six/app/data/config/logger.dart';

/// Handle onMessage, onLaunch and onResume events
void notificationAction(RemoteMessage? remoteMessage) {
  //TODO: Set Firebase notification callback
  logD(remoteMessage?.data.toString() ?? 'No Data');
}

void localNotificationAction(Map<String, dynamic>? remoteMessageData) {
  //TODO: Set local notification callback
  logD(remoteMessageData?.toString() ?? 'No Local Data');
}
