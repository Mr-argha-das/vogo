import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:vogo/core/utils/globalroute.key.dart';
import 'package:vogo/firebase_options.dart';
import 'package:vogo/screens/HomeScreen/View/bottombar.dart';
import 'package:vogo/screens/SplashScreen/View/Splesh_Screen.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> showNotification(RemoteNotification notification) async {
  var androidDetails = AndroidNotificationDetails(
    'channelId',
    'channelName',
    importance: Importance.high,
    priority: Priority.high,
  );
  var notificationDetails = NotificationDetails(android: androidDetails);
  await flutterLocalNotificationsPlugin.show(
    0,
    notification.title,
    notification.body,
    notificationDetails,
  );
}

Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  log("🔙 Background Message: ${message.messageId}");

  if (message.notification != null) {
    log("📩 Notification Title: ${message.notification!.title}");
    log("📩 Notification Body: ${message.notification!.body}");

    // Show local notification in background
    showNotification(message.notification!);
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
  var androidInitialize = const AndroidInitializationSettings(
    '@mipmap/ic_launcher',
  );
  var initializationSettings = InitializationSettings(
    android: androidInitialize,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);

  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    log("Message received: ${message.notification?.title}");
    if (message.notification != null) {
      showNotification(message.notification!);
    }
  });

  FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
    log("User tapped on notification: ${message.data}");
  });
  try {
    await Hive.initFlutter();
    if (!Hive.isBoxOpen('userdata')) {
      await Hive.openBox('userdata');
    }
  } catch (e) {
    log("Hive initialization failed: $e");
  }
  runApp(ProviderScope(child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    requestPermission();
  }

  void requestPermission() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      badge: true,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      log('User granted permission');
    } else if (settings.authorizationStatus == AuthorizationStatus.denied) {
      log('User denied permission');
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(414, 896),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          key: navigatorKey,
          home:
              // BottomNavBar()
              // ProductDetailScreen()
              // FilterScreen()
              // SearchResultsScreen()
              // ExploreScreen()
              // HomeScreen()
              // LoginScreen()
              // SelectLocationScreen()
              // OtpVerificationScreen()
              // // NumberInputScreen()
              SplashScreen1(),

          // const SplashScreen(),
          routes: {'/home': (context) => const BottomNavBar()},
        );
      },
    );
  }
}
