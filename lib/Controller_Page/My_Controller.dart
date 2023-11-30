import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

import '../main.dart';
import '../home_page.dart';

class MyAppController extends GetxController with WidgetsBindingObserver {
  bool isPaused = false;

  bool isLoaded = false;
  NativeAd? nativeAd;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    // appOpenAdManager.loadAd();
    Future.delayed(const Duration(seconds: 3), () async {
      CastTvData.value != {}
          ? Get.off(() => Home_page())
          : initConfig().whenComplete(() {
              CastTvData.value = json.decode(remoteConfig.getString('castTV'));
            });
      await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        CastTvData.value['title'],
        CastTvData.value['body'],
        tz.TZDateTime.now(tz.local).add(Duration(
          // seconds: 5
          hours: CastTvData.value['Time'],
        )),
        const NotificationDetails(
          // Android details
          android: AndroidNotificationDetails('', 'Main ',
              channelDescription: "ashwin",
              importance: Importance.max,
              priority: Priority.max),
        ),
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        androidAllowWhileIdle: true,
      );
    });
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? andriod = message.notification?.android;
      if (notification != null && andriod != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
                android: AndroidNotificationDetails(channel.id, channel.name,
                    playSound: true,
                    color: Colors.blue,
                    icon: '@mipmap/ic_launcher')));
      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print('onmeseage Publish');
      RemoteNotification? notification = message.notification;
      AndroidNotification? andriod = message.notification?.android;
      if (notification != null && andriod != null) {
        var context;
        showDialog(
            context: context,
            builder: (_) {
              return AlertDialog(
                title: Text(notification.title.toString()),
                content: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(notification.body.toString()),
                    ],
                  ),
                ),
              );
            });
      }
    });
  }
}

class NotificationService {
  static final NotificationService _notificationService =
  NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();

  NotificationService._internal();

  Future<void> initNotification() async {
    // Android initialization
    final AndroidInitializationSettings initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');

    // ios initialization

    final InitializationSettings initializationSettings =
    InitializationSettings(
      android: initializationSettingsAndroid,
    );
    // the initialization settings are initialized after they are setted
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }
}
