  // ignore_for_file: non_constant_identifier_names, equal_keys_in_map
  import 'package:cast_tv/screen/Screen_Mirroring/all_media_screen/audio_Player.dart';
  import 'package:timezone/data/latest.dart' as tz;
  import 'dart:convert';
  import 'package:cast_tv/screen/Screen_Mirroring/Cast_To_TV/Cast_To_TV.dart';
  import 'package:cast_tv/screen/Screen_Mirroring/How_to_use/How_to_use1.dart';
  import 'package:cast_tv/screen/Screen_Mirroring/all_media_screen/all%20media%20screen.dart';
  import 'package:cast_tv/home_page.dart';
  import 'package:cast_tv/screen/Screen_Mirroring/help_screen/help.dart';
  import 'package:cast_tv/screen/Screen_Mirroring/mirror_to_tv_screen/mirror%20to%20tv%20screen.dart';
  import 'package:cast_tv/screen/Screen_Mirroring/progress_running_screen/progress_running_screen.dart';
  import 'package:cast_tv/screen/Screen_Mirroring/select_tv/select_tv_screen.dart';
  import 'package:cast_tv/screen/Screen_Mirroring/select_year_screen/select_year_screen.dart';
  import 'package:cast_tv/screen/Video_Player/page.dart';
  import 'package:cast_tv/screen/Video_Player/image.dart';
  import 'package:cast_tv/screen/Video_Player/video.dart';
  import 'package:cast_tv/screen/Whatsapp_direct_screen/Whatsapp_direct_screen.dart';
  import 'package:cast_tv/screen/browser_mirroring_screen/browser_mirroring_screen.dart';
  import 'package:cast_tv/screen/remote_control_screen/TV_remote_screen.dart';
  import 'package:cast_tv/screen/remote_control_screen/choose_tv_brand_screen.dart';
  import 'package:cast_tv/screen/remote_control_screen/remote_control_screen.dart';
  import 'package:cast_tv/screen/remote_control_screen/saved_remote_screen.dart';
  import 'package:cast_tv/splash_screen.dart';
  import 'package:firebase_core/firebase_core.dart';
  import 'package:firebase_messaging/firebase_messaging.dart';
  import 'package:firebase_remote_config/firebase_remote_config.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_local_notifications/flutter_local_notifications.dart';
  import 'package:get/get.dart';
  import 'package:google_mobile_ads/google_mobile_ads.dart';
  import 'Controller_Page/My_Controller.dart';

  MyAppController myAppController = Get.put(MyAppController());

  final FirebaseRemoteConfig remoteConfig = FirebaseRemoteConfig.instance;
  RxMap CastTvData = {}.obs;

  Future initConfig() async {
    await remoteConfig.setConfigSettings(RemoteConfigSettings(
      fetchTimeout: const Duration(seconds: 1),
      minimumFetchInterval: const Duration(seconds: 10),
    ));
    await remoteConfig.fetchAndActivate();
  }
  AppOpenAd? appOpenAd;
  loadAd() {
    AppOpenAd.load(
      // ignore: invalid_use_of_protected_member
      adUnitId: CastTvData.value['appOpen'],
      orientation: AppOpenAd.orientationPortrait,
      request: const AdManagerAdRequest(),
      adLoadCallback: AppOpenAdLoadCallback(
        onAdLoaded: (ad) {
          appOpenAd = ad;
          // isLoaded=true;
          ad.show();
        },
        onAdFailedToLoad: (error) {},
      ),
    );
  }

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
      "Hello ", "Rohan",
      playSound: true, importance: Importance.high);

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    await Firebase.initializeApp();
  }

  Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();
    NotificationService().initNotification();
    tz.initializeTimeZones();
    MobileAds.instance.initialize();
    await Firebase.initializeApp();

    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    initConfig().whenComplete(() {
      CastTvData.value = json.decode(remoteConfig.getString('castTV'));
      loadAd();
    });
    return runApp(GetMaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => Splash_Screen(),
        '/Home_screen': (context) => const Home_page(),
        '/How_to_use1': (context) => const How_to_use1(),
        '/Cast_To_TV': (context) => const Cast_To_TV(),
        '/select_tv': (context) => const select_tv(),
        '/select_year_screen': (context) => const select_year_screen(),
        '/progress_running_screen': (context) => const progress_running_screen(),
        '/mirror_to_tv_screen': (context) => const mirror_to_tv_screen(),
        '/browser_mirroring_screen': (context) =>
            const browser_mirroring_screen(),
        '/all_media_screen': (context) => const all_media_screen(),
        '/remote_control_screen': (context) => const remote_control_screen(),
        '/choose_tv_brand_screen': (context) => const choose_tv_brand_screen(),
        '/TV_remote_screen': (context) => const TV_remote_screen(),
        '/saved_remote_screen': (context) => const saved_remote_screen(),
        '/Whatsapp_direct_screen': (context) => const Whatsapp_direct_screen(),
        '/page': (context) => const page(),
        '/Help': (context) => const Help(),
        '/image': (context) => const image(),
        '/Audio_Player': (context) => const Audio_Player(),
        '/AlbumPage': (context) => const AlbumPage(),
        '/ViewerPage': (context) => ViewerPage(),
        '/Video_Player': (context) => const Video_Player(),
        '/videoalbumPage': (context) => const videoalbumPage(),
        '/videoViewerPage': (context) => const videoViewerPage(),
      },
      // home: Demo(),
      debugShowCheckedModeBanner: false,
    ));
  }
