// ignore_for_file: unused_local_variable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationServices {
  var mNotificationManager = FlutterLocalNotificationsPlugin();

  void initlizeNotification(onNotificationTap) {
    var androidInitSettings = const AndroidInitializationSettings('app_icon');
    var iosInitSetting = DarwinInitializationSettings();
    var macInitSetting = DarwinInitializationSettings();
    var initSettings = InitializationSettings(
      android: androidInitSettings,
      iOS: iosInitSetting,
      macOS: macInitSetting,
    );

    mNotificationManager.initialize(
      initSettings,
      onDidReceiveNotificationResponse: onNotificationTap,
    );
    mNotificationManager
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()!
        .requestNotificationsPermission();
  }

  sendNotification({
    int id = 100,
    required String title,
    required String body,
  }) {
    var androidNotificationDetails = AndroidNotificationDetails(
      'test',
      'test channel',
      autoCancel: true,
      color: const Color.fromARGB(83, 255, 255, 255),
      ongoing: true,
      largeIcon: DrawableResourceAndroidBitmap('app_icon'),
    );

    var iosNotificationDeatails = DarwinNotificationDetails(subtitle: 'test');

    var notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDeatails,
      macOS: iosNotificationDeatails,
    );
    mNotificationManager.show(id, title, body, notificationDetails);
  }

  scheduleNotification({
    int id = 100,
    required String title,
    required String body,
  }) {
    var androidNotificationDetails = AndroidNotificationDetails(
      'test',
      'test channel',
      autoCancel: true,
      color: const Color.fromARGB(83, 255, 255, 255),
      ongoing: true,
      largeIcon: DrawableResourceAndroidBitmap('app_icon'),
    );

    var iosNotificationDeatails = DarwinNotificationDetails(subtitle: 'test');
    var notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDeatails,
      macOS: iosNotificationDeatails,
    );
    mNotificationManager.periodicallyShow(
        id, title, body, RepeatInterval.everyMinute, notificationDetails);
  }

  cancelNotification({int id = 100}) {
    mNotificationManager.cancel(id);
  }
}
